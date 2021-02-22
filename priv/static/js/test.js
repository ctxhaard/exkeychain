import { Socket } from './phoenix.dev.js';

let socket = new Socket("/socket", { params: { userToken: "123" }});
socket.connect();

let channel = socket.channel("room:123", {token: "roomToken"});

channel.on("new_msg", msg => console.log("Got message", msg) );
channel.join()
    .receive("ok", ({messages}) => console.log("catching up", messages) )
    .receive("error", ({reason}) => console.log("failed join", reason) )
    .receive("timeout", () => console.log("Networking issue. Still waiting..."));