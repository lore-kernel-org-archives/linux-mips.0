Received: from nf-out-0910.google.com ([64.233.182.185]:31898 "EHLO
	nf-out-0910.google.com") by ftp.linux-mips.org with ESMTP
	id S20037046AbYGMOx1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sun, 13 Jul 2008 15:53:27 +0100
Received: by nf-out-0910.google.com with SMTP id h3so1195328nfh.14
        for <linux-mips@linux-mips.org>; Sun, 13 Jul 2008 07:53:26 -0700 (PDT)
Message-ID: <4ac2955e0807130753ydaf0d10n9d95d4d51baf660b@mail.gmail.com>
Date: Sun, 13 Jul 2008 20:23:26 +0530
From: "mahendra varman" <mahendravarman15@gmail.com>
Subject: rtc integration with hwclock
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_27287_27720679.1215960806080"
Return-Path: <mahendravarman15@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linuxppc-embedded@ozlabs.org., linux-kernel@vger.kernel.org, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20080713145326.CNBamcgjJj0-HOYGiO3-FEJAd_NDDnuAZhd77xFTFAA@z>

------=_Part_27287_27720679.1215960806080
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

Help me to solve the below point

Hi have wrote a simple i2c based driver for rtc chip (x1226) in linux 2.6
with inbuilt i2c routines.

In the get_rtc_time routine i can able to read the values from the rtc chip
and store it in variables

I need to know how to update those values into the rtc structure so that if
i put hwclock it should display the read value....


Any example code depicting the above point is also welcome


Thanks in advance

------=_Part_27287_27720679.1215960806080
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi<br><br>Help me to solve the below point<br><br>Hi have wrote a simple i2c based driver for rtc chip (x1226) in linux 2.6 with inbuilt i2c routines.<br><br>In the get_rtc_time routine i can able to read the values from the rtc chip and store it in variables<br>
<br>I need to know how to update those values into the rtc structure so that if i put hwclock it should display the read value....<br><br><br>Any example code depicting the above point is also welcome<br><br><br>Thanks in advance<br>

------=_Part_27287_27720679.1215960806080--
