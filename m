Message-ID: <048701c26638$bb357640$bc00a8c0@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20020927144641.23180.qmail@mailweb33.rediffmail.com>
Subject: Re: mips kseg1 mapping..
Date: Fri, 27 Sep 2002 11:15:36 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@ltc.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: atul srivastava <atulsrivastava9@rediffmail.com>, linux-mips@linux-mips.org
Message-ID: <20020927151536.C1drUHFacd0sF0JN_op7Z4rWW8mbbXgAeonNdksN_os@z>

----- Original Message -----
From: "atul srivastava" <atulsrivastava9@rediffmail.com>
To: <linux-mips@linux-mips.org>
Sent: Friday, September 27, 2002 10:46 AM
Subject: mips kseg1 mapping..


> 1.PCI BAR 1 of my eepro100 card has been initialised with
> address 0x18800100 for 64 bytes.
> this is a valid PCI IO address as per manual.
>
> 2.what i understand is that lower 0 - 512 MB physical is mapped to
> 0xa000-0000 to 0xb7ff-ffff virtual and also access to this range
> in uncached.
>
> 3.when i am loading my eepro100 driver , in do_eeprom_cmd() when
> it refers the address( ioaddr + SCBeeprom) my kernel panicks with
> message "unable to handle kernel paging request at 0xd100010e.
>
> this virtual address is in range 0xa000-0000 to 0xb7ff-ffff.

KSEG1 is always mapped (you can think of it as wired).

PCI bus addresses should be remapped through ioremap.  Is ioremap returning
the address you expect?

Regards,
Brad
