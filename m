content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Gcc - can't branch to undefined symbol
Date: Thu, 29 Jan 2004 12:25:16 -0800
Message-ID: <603BA0CFF3788E46A0DB0918D9AA95100A0E3088@sj580004wcom.int.lantronix.com>
From: "Jerry Walden" <jerry.walden@lantronix.com>
Return-Path: <jerry.walden@lantronix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040129202516.4RIcHPRHqFmFt5mtRPpzEbUpCHqNnMQNoR6xZBZcB44@z>

Hello -

I am using gcc 3.3.2 - when I assemble a file that has a branch to a
label, and the label is not defined in the .S file (i.e. there is no
extern - the label exists in another .S file) the error "cannot branch
to an undefined symbol" results.  Using an older version of
mipsel-gnu-linux-gcc does not report this error.  Any idea what I am
doing wrong?

Thanks
