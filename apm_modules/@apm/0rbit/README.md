# 0rbit Package

**0rbit** is the Lua Module designed for interacting with [0rbit](https://0rbit.co) to **Access Real World Data** into your `ao` process. 

## Features 

- **GET Request**: Make a HTTP GET request to any valid URL.
- **POST Request**: Make a HTTP POST request to any valid URL.
- **Receive Response**: Receive the response of the request made.
- **Balance**: Get the balance of **0RBT POINTS** of your processId.

## Installation

### Using APM

1. Open your AOS and `laod` APM blueprint in to your process.

    ```bash
    .load-blueprint apm
    ```
2. Install the `0rbit` package.

    ```bash
    APM.install("0rbit")
    ```

### Import Module
    
```lua
_0rbit = require("0rbit")
```

### Directly from Source

Copy `src/main.lua` file and paste it into your directory named as `0rbit.lua`.

## Usage

### Creating a GET Request

```lua
_0rbit.sendGetRequest(GET_URL)
```
- `GET_URL`: The URL to make a GET request.

### Creating a POST Request

```lua
_0rbit.sendPostRequest(POST_URL, POST_BODY, POST_HEADERS)
```
- `POST_URL`: The URL to make a POST request.
- `POST_BODY` (optional): The body to be sent in POST request.
- `POST_HEADERS` (optional): The headers to be sent in POST request.

### Receiving Response and Executing a function
    
```lua
_0rbit.receiveResponse(msg, onResponse)
```
- `msg`: The message to be received.
- `onResponse` (optional): The function to be executed on response. If not provided, it will execute an empty function.

### Checking $0RBT Balance 

```lua
_0rbit.getBalance(address)
```
- `address` (optional): The address of the processId. If not provided, it will take the process Id of the current process.

## Example

You can example implementation with 0rbit Package at [example](example.lua) file.