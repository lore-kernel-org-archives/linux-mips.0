Message-ID: <070501c183f9$6b02de50$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20011213163953.GB23023@paradigm.rfc822.org> <06c701c183f7$d23eb410$5601010a@prefect> <20011213170410.GB25296@paradigm.rfc822.org>
Subject: Re: [PATCH] /proc/cpuinfo endianess (autoconf dependencie)
Date: Thu, 13 Dec 2001 12:13:00 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Florian Lohoff <flo@rfc822.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011213171300.nnTZwhwlBMLu_EErmXkWqkxxZ6w-Zmls8WXaL0SwEmE@z>

----- Original Message -----
From: "Florian Lohoff" <flo@rfc822.org>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Thursday, December 13, 2001 12:04 PM
Subject: Re: [PATCH] /proc/cpuinfo endianess (autoconf dependencie)

> There is - But autoconf in the current version is broken and needs
> this to gather the endianess - As we currently have to live with it
> this is a 2.4 issue - 2.5 should fix this and remove endianess from
> /proc/cpuinfo.

I understand, thanks for the explanation.  So the patch should only go in
the 2.4 branch?

Regards,
Brad
