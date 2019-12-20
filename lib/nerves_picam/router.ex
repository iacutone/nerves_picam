defmodule NervesPicam.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  get "/" do
    markup = """
    <html>
    <head>
      <title>Picam Video Stream</title>
    </head>
    <body>
      <img src="video.mjpg" />
    </body>
    </html>
    """
    conn
    |> put_resp_header("Content-Type", "text/html")
    |> send_resp(200, markup)
  end

  forward "/video.mjpg", to: NervesPicam.Streamer
end
