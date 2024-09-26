let startTime, updatedTime, tInterval;
let running = false;

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
    minutes
  );
}

const startMeasurement = () => {
  const startBtn = document.getElementById("start-btn");
  if (startBtn) {
    running = sessionStorage.getItem("running") === "true";
    startBtn.addEventListener("click", function() {
      if (!running) {
        running = true;
        sessionStorage.setItem("running", running)
        startTime = new Date().getTime();
        console.log(startTime)
        sessionStorage.setItem("startTime", startTime);
      }
    });
  }
}

const displayTime = () => {
  const timeDisplay = document.getElementById("time-display");

  if (timeDisplay) {
    startTime = sessionStorage.getItem("startTime");
    if (!startTime) {
      startTime = new Date().getTime();
      sessionStorage.setItem("startTime", startTime);
    }

    timeDisplay.innerHTML = updateTime();
    tInterval = setInterval(() => {
      timeDisplay.innerHTML = updateTime();
    }, 60000);
  }
}

const finishMeasurement = () => {
  const finishBtn = document.getElementById("finish-btn");
  const studyTimeField = document.getElementById("study-time-field");
  const dynamicForm = document.getElementById("dynamic-form");
  const studyTimeInfo = document.getElementById("study-time-info"); 

  if (finishBtn && studyTimeInfo) {
    startTime = sessionStorage.getItem("startTime");
    const studyTimeId = studyTimeInfo.getAttribute("study-time-id");
    finishBtn.addEventListener("click", function() {
      clearInterval(tInterval);
      const studyTime = updateTime();
      running = false;
      sessionStorage.setItem("running", running)


      studyTimeField.value = studyTime;
      dynamicForm.action = `/studies/${studyTimeId}/finish`
      const methodInput = document.createElement('input');
      methodInput.type = 'hidden';
      methodInput.name = '_method';
      methodInput.value = 'patch';
      dynamicForm.appendChild(methodInput);
      
      const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
      const csrfInput = document.createElement('input');
      csrfInput.type = 'hidden';
      csrfInput.name = 'authenticity_token';
      csrfInput.value = csrfToken;
      dynamicForm.appendChild(csrfInput);
      console.log(dynamicForm)
      dynamicForm.submit();
    });
  }
}


document.addEventListener("turbo:load", startMeasurement)
document.addEventListener("turbo:load", displayTime)
document.addEventListener("turbo:load", finishMeasurement)
