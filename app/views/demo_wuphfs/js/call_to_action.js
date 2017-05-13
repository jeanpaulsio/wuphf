document.addEventListener("DOMContentLoaded", function(){
    Typed.new(".who-to-wuphf", {
        strings: [
          "friends.^1500",
          "family.^1500",
          "boss.^1500",
          "coworkers.^1500",
          "bff."
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
