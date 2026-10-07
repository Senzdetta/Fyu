// https://github.com/Senzdetta/Fyu

module module_.uwu;

import std.stdio;
import std.datetime;
import core.thread;
import console.command_interface;

class Uwu : Command {
    void execute(string[] args) {
        nyanners(5.seconds);
    }

    void nyanners(Duration duration) {
        string[] faces = [
            "(｡◕‿◕｡)",
            "(≧◡≦)",
            "ʕ•ᴥ•ʔ",
            "(・ω・)",
            "(๑˃ᴗ˂)ﻭ",
            "(ง'̀-'́)ง",
            "(=^･ω･^=)"
        ];

        string fixface = "(・ω・)";

        auto delay = 200.msecs;
        auto endTime = MonoTime.currTime + duration;

        size_t kaomoji = 0;

        writef("\x1b[?25l");
        while (MonoTime.currTime < endTime) {
            writef(
                "\r%s\x1b[K",
                faces[kaomoji % faces.length],
            );

            stdout.flush();
            Thread.sleep(delay);
            kaomoji++;
        }

        writef(
            "\r%s\x1b[K\x1b[?25h\n",
            fixface,
        );
        stdout.flush();
    }
}

// Copyright (c) 2026 Senzdetta