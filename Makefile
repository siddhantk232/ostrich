real32build:
	nasm real_32/main.asm -f bin -o real32build.bin

real32run:
	qemu-system-x86_64 -fda real32build.bin

clean:
	rm real32build.bin

boot_disk_read:
	qemu-system-x86_64 -fda boot_disk_read.bin

