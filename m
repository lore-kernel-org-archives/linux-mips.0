Received: from smtp102.biz.mail.re2.yahoo.com ([68.142.229.216]:46937 "HELO
	smtp102.biz.mail.re2.yahoo.com") by ftp.linux-mips.org with SMTP
	id S8133451AbVJUPKw (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 21 Oct 2005 16:10:52 +0100
In-Reply-To: <DAF42D2FFC65A146BAB240719E4AD214C212F3@gbrwgceumf02.eu.xerox.net>
References: <DAF42D2FFC65A146BAB240719E4AD214C212F3@gbrwgceumf02.eu.xerox.net>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <11386cff191ef9d9414dbde253de402d@embeddedalley.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddedalley.com>
Subject: Re: au1x00 usb device status
Date: Fri, 21 Oct 2005 11:16:36 -0400
Return-Path: <dan@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Hamilton, Ian" <Ian.Hamilton@xerox.com>
Cc: 'linux-mips@linux-mips.org'MIPSlinux-mips@linux-mips.org
Message-ID: <20051021151636.EVbzqyQxe0U0mwwBDOYtLcmN086EJQqFcIjqqC_h5Ts@z>


On Oct 21, 2005, at 10:01 AM, Hamilton, Ian wrote:

> ......  so I guess a tty/raw emulation
> would be appropriate,

That's all that was available in 2.4.  I'd say if you actually
see it working, you are lucky :-)  The only way I have seen
this work successfully in a real product was using a
custom RTLinux driver to service most of the USB hardware,
then feed this upstream to the Linux USB software.

> I was hoping it would be a straight copy from 2.4 to 2.6, but clearly 
> it
> isn't :-(

You will want to use the gadget interface.  I think most of what
we had done in the past has been checked in, but if not I'll
dig it out.  It was never functional to my satisfaction.


Thanks.


	-- Dan
