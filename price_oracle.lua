_0rbit = require("oracle")
local json = require("json")

GET_URL = "https://api.diadata.org/v1/assetQuotation/Arweave/0x0000000000000000000000000000000000000000"

AR_PRICE = AR_PRICE or {}
Subscribable = require "subscribable" ({
    useDB = false -- using the vanilla flavour
})

Subscribable.configTopicsAndChecks({
    ['update-price'] = {
        checkFn = function() return true end,
        payloadFn = function() return { price = AR_PRICE } end
    }
})

function onResponse(msg)
    local res = json.decode(msg.Data)
    AR_PRICE = res.Price;
    print("AR_PRICE: " .. AR_PRICE)
    Subscribable.checkNotifyTopic('update-price')
end

Handlers.add(
    "UpdatePrice",
    function()
        _0rbit.sendGetRequest(GET_URL)
    end
)

Handlers.add(
    "Receive-Response",
    Handlers.utils.hasMatchingTag("Action", "Receive-Response"),
    function(msg)
        _0rbit.receiveResponse(msg, onResponse)
    end
)
