Reply-To: <khs@digital-digital.com>
From: "Han-Seong Kim" <khs@digital-digital.com>
Subject: RE: Power MGMT on mips
Date: Mon, 19 Nov 2001 21:13:08 +0900
Message-ID: <000001c170f3$8d784d80$cbadfea9@khs>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20011112233031.A6493@dea.linux-mips.net>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: 'Ralf Baechle' <ralf@oss.sgi.com>
Cc: linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20011119121308.r_1w1BgoSC6vFg9z89FfXQGxwR-e8qe5x9Tt6MhRB74@z>

Hi Ralf,

I reviewed the data sheet of Mips CPU - QED RM5231.
There is a wait instruction.
But when the SysAD bus goes to idle, the wait instruction is valid.
How can I SysAD bus make idle state?

Han-Seong

-----Original Message-----
From: Ralf Baechle [mailto:ralf@oss.sgi.com]
Sent: Monday, November 12, 2001 9:31 PM
To: Han-Seong Kim
Cc: linux-mips@fnet.fr; linux-mips@oss.sgi.com
Subject: Re: Power MGMT on mips


On Mon, Nov 12, 2001 at 05:13:40PM +0900, Han-Seong Kim wrote:

> I want to ask about Power-Mnagement on mips.
> 1. Is it possible to use power mgnt (ex. apm,acpi) features of linux kernel?

Both are PC stuff, so no.

> 2.If no, how can manage CPU and Bidge chips for power mgnt ?

Right now Linux/MIPS will only use the CPU's power managment features, that
is the wait instruction or similar.

  Ralf
