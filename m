Received: from [220.76.242.187] ([220.76.242.187]:19934 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133906AbWFOAiR (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 15 Jun 2006 01:38:17 +0100
Message-ID: <003c01c69014$4948a0c0$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
References: <003401c68fa0$b60f4070$9d0ba8c0@mrv> <20060614115316.GA4515@linux-mips.org>
Subject: Re: "undefined symbol" on 2.6.14
Date: Thu, 15 Jun 2006 09:40:20 +0900
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
Message-ID: <20060615004020.stTOwQIU2mWFP4xyoHl2o9ReuPEWV4dLfYjvfaORFxU@z>

Hello, Ralf!
You wrote to "Roman Mashak" <mrv@corecom.co.kr> on Wed, 14 Jun 2006 12:53:16 
+0100:

 RB> The symbol isn't export simply because it wasn't considered useful to
 RB> export it.  The expected use of mips_hpt_frequency is to initialize it
 RB> in the platform code as system startup time to the counter frequency,
 RB> then not look at it again.

 RB> I wonder how you're using it in your module?
Actually it's not used anywhere in driver. Only timer functions and 
structures are in code. How come the linker refers to this particular 
function?

 RB> Any export I would add - as per general policy for the kernel - an
 RB> EXPORT_SYMBOL_GPL btw.

With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
