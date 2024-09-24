let startTime, updatedTime, difference, tInterval;
let running = false;

const startMeasurement = () => {
  const startBtn = document.getElementById("start-btn");

  if (startBtn) {
    startBtn.addEventListener("click", function() {
      if (!running) {
        difference = 0;
        running = true;
        startTime = new Date().getTime();
      }
    });
  }
}

const displayTime = () => {
  const timeDisplay = document.getElementById("time-display");

  if (timeDisplay && running) {
    timeDisplay.innerHTML = updateTime();
    tInterval = setInterval(updateTime, 600000);

    // 時間を更新する関数
    function updateTime() {
      updatedTime = new Date().getTime() - startTime;
      return formatTime(updatedTime);
    }
  
    // フォーマットする関数
    function formatTime(ms) {
      const totalSeconds = Math.floor(ms/1000);
      const minutes = Math.floor(totalSeconds/60);
      return (
        `${minutes}分`
      );
    }
  }
}

const finishMeasurement = () => {
  const stopBtn = document.getElementById("stop-btn");

  if (stopBtn) {
    stopBtn.addEventListener("click", function() {
      clearInterval(tInterval);
      difference = new Date().getTime() - startTime;
      running = false;
    });
  }
}


document.addEventListener("turbo:load", startMeasurement)
document.addEventListener("turbo:load", displayTime)
document.addEventListener("turbo:load", finishMeasurement)
