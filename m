Received: from [220.76.242.187] ([220.76.242.187]:60083 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133478AbWFNKu6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 14 Jun 2006 11:50:58 +0100
Received: from mrv ([192.168.11.157])
	by localhost.localdomain (8.12.8/8.12.8) with SMTP id k5EAqFBb029737
	for <linux-mips@linux-mips.org>; Wed, 14 Jun 2006 19:52:18 +0900
Message-ID: <003401c68fa0$b60f4070$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
Subject: "undefined symbol" on 2.6.14
Date: Wed, 14 Jun 2006 19:53:01 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="koi8-r";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@corecom.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060614105301.qlw1FPURUxxGmVcXtDsUKwtVXTnvq9fZ60x_nhk7Oh8@z>

Hello.

I compiled driver as a module (for our own device) for MIPS target. At 
loading time get:

unresolved symbol 'mips_hpt_frequency'

Modules.symvers which contains symbols doesn't have reference for 
'mips_hpt_frequency'. Doesn it mean it's supposed to be exported with 
EXPORT_SYMBOL or my problem's reason lies on another layer?

Thanks!

With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
