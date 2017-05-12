document.addEventListener("DOMContentLoaded", function(){
    Typed.new(".who-to-wuphf", {
        strings: [
          "yourself.^1500",
          "your bff.^1500",
          "your boss.^1500",
          "your coworkers.^1500"
        ],
        stringsElement: null,
        typeSpeed: 70,
        startDelay: 600,
        // backspacing speed
        backSpeed: 50,
        // shuffle the strings
        shuffle: false,
        // time before backspacing
        backDelay: 900,
        // loop
        loop: true,
        // false = infinite
        loopCount: false,
        // show cursor
        showCursor: true,
        // character for cursor
        cursorChar: "|",
    });
});
