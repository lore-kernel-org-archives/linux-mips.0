Received: from [220.76.242.187] ([220.76.242.187]:62661 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133862AbWFOBHx (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 15 Jun 2006 02:07:53 +0100
Message-ID: <003e01c69018$6bc4eb00$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
References: <003401c68fa0$b60f4070$9d0ba8c0@mrv> <20060614115316.GA4515@linux-mips.org>
Subject: Re: "undefined symbol" on 2.6.14
Date: Thu, 15 Jun 2006 10:09:55 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@corecom.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20060615010955.CDu-zsX2RIEl2z6H9uI69xSMqHnfGw5zuIDUfgBkW-A@z>

Hello, Ralf!
You wrote to "Roman Mashak" <mrv@corecom.co.kr> on Wed, 14 Jun 2006 12:53:16 
+0100:

[skip]
 RB> The symbol isn't export simply because it wasn't considered useful to
 RB> export it.  The expected use of mips_hpt_frequency is to initialize it
 RB> in the platform code as system startup time to the counter frequency,
 RB> then not look at it again.
I should've been more clear here. We use MIPS-based processor from Cavium 
Networks and their toolchain and 64-bit mode patched kernel 2.6.14.

 RB> I wonder how you're using it in your module?

With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
