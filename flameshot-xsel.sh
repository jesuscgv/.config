#!/bin/bash
flameshot &
disown
flameshot gui
pkill flameshot
