Message-ID: <035001c18802$6af8d8d0$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20011218150423.A12143@neurosis.mit.edu>
Subject: Re: ISA
Date: Tue, 18 Dec 2001 15:27:29 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: jim@jtan.com, linux-mips@oss.sgi.com
Message-ID: <20011218202729.luJtVvFMmIPzslHInpd8hsn11rPYxvbMXKxEvTMl_V8@z>

----- Original Message ----- 
From: "Jim Paris" <jim@jtan.com>
To: <linux-mips@oss.sgi.com>
Sent: Tuesday, December 18, 2001 3:04 PM
Subject: ISA


> Okay, so I'll change the i82365 driver to use isa_{read,write}[bwl]
> instead of ioremap & {read,write}[bwl], when CONFIG_ISA is defined.
> That shouldn't break other architectures.

Admittedly I haven't studied this, but ugh... can't we let isa_* die?

Regards,
Brad
