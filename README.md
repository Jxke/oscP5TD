# oscP5TD

A simple two-way OSC (Open Sound Control) communication demo between **TouchDesigner** and **Processing** using the `oscP5` library.

This project demonstrates:
- Sending float values (e.g. slider values) from TouchDesigner to Processing.
- Sending interaction data (e.g. `mousePressed` events) from Processing to TouchDesigner.

Ideal for interactive installations, real-time control, and audiovisual experimentation.

---

## 📁 Files

- `oscP5TDsendReceive.pde` — Processing sketch that receives float values from TouchDesigner and sends back mouse positions.
- `oscTDP5sendReceive.toe` — TouchDesigner project that sends slider values and receives mouse click data from Processing.

---

## 🔌 OSC Communication Overview

| Direction           | Sender         | Receiver        | Port   | Description                         |
|---------------------|----------------|-----------------|--------|-------------------------------------|
| TD → Processing     | TouchDesigner  | Processing      | 12000  | Sends float values (e.g. `/v1`)     |
| Processing → TD     | Processing     | TouchDesigner   | 10000  | Sends mouse X/Y on `/mouseClick`    |

---

## 🛠️ Setup Instructions

### 🌀 TouchDesigner

1. Open `oscTDP5sendReceive.toe`.
2. In `OSC Out CHOP`, set:
   - **IP**: `127.0.0.1`
   - **Port**: `12000`
3. In `OSC In DAT`, set:
   - **Port**: `10000`
4. Run the network to start sending and receiving messages.

### 🎨 Processing

1. Open `oscP5TDsendReceive.pde` in Processing.
2. **Install the oscP5 library**:
   - Go to `Sketch` > `Import Library` > `Manage Libraries...`
   - Search for **oscP5 by Andreas Schlegel**
   - Click **Install**
3. Run the sketch.
   - It listens on port `12000` for messages from TD for the Slider Float value.
   - It sends 1/2 `/mouseClick` channels with messages of the X/Y coordinates to TD on port `10000`.

---

## 📦 Requirements

- [TouchDesigner](https://derivative.ca/)
- [Processing](https://processing.org/)
- [oscP5 library](https://sojamo.de/libraries/oscP5/)

---

## 🧠 Credits

Created by **Jake Tan**  
Built with `oscP5` by **Andreas Schlegel** and **TouchDesigner** by Derivative.

---