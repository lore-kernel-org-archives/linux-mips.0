content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: ASID query : 2.4.20
Date: Mon, 23 Jun 2003 10:58:41 -0700
Message-ID: <D9F6B9DABA4CAE4B92850252C52383AB0796834F@ex-eng-corp.efi.com>
From: "Ranjan Parthasarathy" <ranjanp@efi.com>
Return-Path: <ranjanp@efi.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030623175841.KCpJytowMgjrZdWwmyV9UHKVY7cjVummB11uLWsQP1c@z>

I am seeing an issue with the way the current ASID circulation is implemented. The processor I am working on has the global bit implemented in the entryhi instead of the lo0 and lo1 registers.

Entry hi

31:13 : VPN2
12:7   : Reserved
6       : Global Bit
5:0    :  ASID

The ASID_MASK is 0x3f and ASID_FIRST_VERSION becomes 0x40 which seems to be written to the entryhi if we use the current code. On most processors the bits after the ASID upto the VPN/VPN2 bits seem to be reserved,RO, writes are ignored and so things do not break. In our case this does not work as ASID_FIRST_VERSION would enable the global bit when we launch the first process.

The code in asm-mips/mmu_context.h should use

write_c0_entryhi(cpu_asid(cpu,next));
instead of 
write_c0_entryhi(cpu_context(cpu,next));

in functions switch_mm,activate_mm,drop_mmu_context.

Any comments, feedback is most welcome.

Thanks

Ranjan
