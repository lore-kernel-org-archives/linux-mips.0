Message-ID: <015a01c158c0$fa562800$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20011018185717.A8135@lucon.org> <3BD05A9A.BD06491C@mvista.com>
Subject: Re: Strange behavior of serial console under 2.4.9
Date: Fri, 19 Oct 2001 13:10:39 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>, "H . J . Lu" <hjl@lucon.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011019171039.n2-80ueuULyM9S7d9FXHowj2-HFZRen4H4-O_Pn8pZk@z>

Let's try that again...

Agreed - I've seen it once where it spit 16 chars, long pause, 16 more
chars, etc.  This was due to the serial driver not getting interrupts.

Regards,
Brad

----- Original Message ----- 
From: "Jun Sun" <jsun@mvista.com>
To: "H . J . Lu" <hjl@lucon.org>
Cc: <linux-mips@oss.sgi.com>
Sent: Friday, October 19, 2001 12:53 PM
Subject: Re: Strange behavior of serial console under 2.4.9


> "H . J . Lu" wrote:
> > 
> > The serial console under 2.4.9 is very strange. It is very slow. I have
> > no such problem with 2.4.3/2.4.5. Telnet is fine.
> > 
> 
> That is usually a symptom when the serial interrupts are not correctly
> delivered.
