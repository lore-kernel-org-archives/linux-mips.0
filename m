Message-ID: <00bd01c21618$4e714ef0$4c00a8c0@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20020617094851.30730.qmail@email.com>
Subject: Re: Code error - why?
Date: Mon, 17 Jun 2002 12:01:56 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Balakrishnan Ananthanarayanan <balakris_ananth@email.com>, linux-mips@oss.sgi.com
Message-ID: <20020617160156.vp7xGTiAM6LCHeDHpEwq9qU7-ubUnDTIw6T0efuk_nQ@z>

Drop the $ on the registers?

Regards,
Brad

----- Original Message -----
From: "Balakrishnan Ananthanarayanan" <balakris_ananth@email.com>
To: <linux-mips@oss.sgi.com>; <linux-kernel@vger.kernel.org>;
<redhat-list@redhat.com>
Sent: Monday, June 17, 2002 5:48 AM
Subject: Code error - why?


> I wrote a SAMPLE CODE - Hello.S to work for a cross-assembler
mips-linux-as - but this is giving me an error message:
>    ".data
>          quest: .asciiz "Hello World!"
>     .text
>     _start:
>          la $a0, quest
>          li $v0, 4
>          syscall   "
>
> The error messages are:
>   " Hello.S line 5: illegal operands 'la'
>     Hello.S line 6: illegal operands 'li'"
>
> Can anyone help? What is wrong?
