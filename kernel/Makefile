run:
	gcc -ffreestanding -c kernel.c -o kernel.o
	ld -Ttext 0x1000 -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
	nasm -f bin bootsect.asm -o bootsect.bin
	cat bootsect.bin kernel.bin  > os-image
	qemu-system-x86_64 -fda os-image
