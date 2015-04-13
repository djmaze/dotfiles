package main

import (
	"fmt"
	"os"
	"syscall"
)

func main() {
	env := os.Environ()

	pwd, err := syscall.Getwd()
	if err != nil {
		panic(err)
	}

	args := []string{
		"vim",
		"docker", "run", "-it", "--rm",
		"-e", os.ExpandEnv("TMUX=$TMUX"),
		"-v", "/tmp/tmux-1000:/tmp/tmux-1000",
		"-v", fmt.Sprintf("%s:/home/work/workspace", pwd),
		"myvim",
	}
	args = append(args, os.Args[1:]...)

	err = syscall.Exec("/usr/bin/sudo", args, env)
	if err != nil {
		panic(err)
	}
}
