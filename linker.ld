OUTPUT_FORMAT("pei-x86-64")
ENTRY(UefiMain)
SECTIONS
{
    .text :
    {
        *(.text)
    }

    .data :
    {
        *(.data)
    }

    .bss :
    {
        *(COMMON)
        *(.bss)
    }
}
