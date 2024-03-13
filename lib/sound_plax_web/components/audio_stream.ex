defmodule SoundPlaxWeb.AudioStream do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="audio_stream">
      <b>Microfone Stream</b>

      <p>fale e se ouça falando</p>

      <script>
        navigator.mediaDevices.getUserMedia({ audio: true })
          .then(function(stream) {
            // Create an audio context
            var audioCtx = new AudioContext();

            // Create a MediaStreamAudioSourceNode from the stream
            var source = audioCtx.createMediaStreamSource(stream);

            // Create an analyser node to visualize the audio (optional)
            var analyser = audioCtx.createAnalyser();
            source.connect(analyser);

            // Create a gain node to control playback volume (optional)
            var gainNode = audioCtx.createGain();
            analyser.connect(gainNode);

            // Connect the audio source to the speakers
            gainNode.connect(audioCtx.destination);

            // Optional: Set the gain (volume)
            gainNode.gain.setValueAtTime(3.5, audioCtx.currentTime);
          })
          .catch(function(error) {
            console.error("Error accessing microphone:", error);
          });
      </script>
    </div>
    """
  end
end
