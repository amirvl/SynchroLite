# interactive-art-1

*Creative Description:*

	Connecting through Light and Motion

	Imagine communicating with a friend using simple gestures and a display of glowing lights. This project is an interactive messaging experience using an LED matrix. By waving a hand over sensors, users can send short messages and expressive GIFs to each other. From a sad broken heart to a cheerful “hi,” or even a twinkling starry night, each gesture lights up the display and sends a unique message to the other side. Whether it's sharing emotions with colorful motion graphics or just letting someone know you’re there, this project turns simp


*Technical Description:*

	Arduino-Based Wireless Messaging with LED Matrix Display

	This project uses Arduino, Processing, MQTT, and shiftr.io to create an interactive messaging system between two users. It employs two distance sensors and one motion sensor to send data wirelessly to an LED matrix display (32x8 pixels) via MQTT. The system is designed with two Arduino setups: one acting as the sender and the other as the receiver. The sender Arduino connects to two sharp distance sensors and a motion sensor to capture user input. Mapped values are transmitted through Processing and shiftr.io’s MQTT server to the receiver Arduino, which controls the LED matrix.

	The LED matrix showcases various GIFs, including a sad broken heart, a cheerful "hi," and a twinkling starry night. For more dynamic communication, the second sensor also triggers motion graphics with a hue-changing feature based on hand distance. One technical challenge was the representation of GIFs in hexadecimal, as the LED matrix is wired in series, requiring odd rows to be reversed for proper visualization. Each frame of the GIFs was hand-drawn in Photoshop, converted into pixel values, and translated into hexadecimal arrays for the Arduino to interpret.
