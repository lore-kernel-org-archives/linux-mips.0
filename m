Received: from david.siemens.com.cn ([194.138.202.53]:61391 "EHLO
	david.siemens.com.cn") by ftp.linux-mips.org with ESMTP
	id S20038547AbWKHImD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 8 Nov 2006 08:42:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 8BIT
Subject: RE: MIPS processors gain GNU/Linux binary prelinker
Date: Wed, 8 Nov 2006 16:41:42 +0800
Message-ID: <96E7D5519FC3D741BEE27AB88C738797012FA7E2@PEKW934A.cn001.siemens.net>
In-Reply-To: <000801c702fb$c96e89e0$0202fea9@swcenter.sec.samsung.co.kr>
From: "Fu, He Wei PSE NKG" <hewei.fu@siemens.com>
Return-Path: <hewei.fu@siemens.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: =?ks_c_5601-1987?B?sei5zsL5?= <barrioskmc@gmail.com>, Thiemo Seufer <ths@networkno.de>, Tim Bird <tim.bird@am.sony.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20061108084142.6-dPMNcx5K2H4PBaOdy5nMIkJ0Jx-DG71n9yPeNrU4M@z>

http://people.redhat.com/jakub/prelink.pdf
I don¡¯t know whether is it useful? 

-----Original Message-----
From: linux-mips-bounce@linux-mips.org [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of ???
Sent: Wednesday, November 08, 2006 2:05 PM
To: 'Thiemo Seufer'; 'Tim Bird'
Cc: linux-mips@linux-mips.org
Subject: RE: MIPS processors gain GNU/Linux binary prelinker

Who know anymore about prelink for mips architecture? 
Let me know prelink for mips detaily.
Thanks in advance.


-----Original Message-----
From: linux-mips-bounce@linux-mips.org [mailto:linux-mips-bounce@linux-mips.
org] On Behalf Of Thiemo Seufer
Sent: Tuesday, November 07, 2006 11:05 PM
To: Tim Bird
Cc: CE Linux Developers List; linux-mips@linux-mips.org
Subject: Re: MIPS processors gain GNU/Linux binary prelinker

Tim Bird wrote:
> FYI - For those interested in bootup time improvements on MIPS
> processors, here is some information about the recently
> developed MIPS prelinking feature, done by CodeSourcery
> and MIPS Technologies.

The patches are showing up piecemeal now on the various mailing lists,
I also dumped a debian-styleish patchset at
ftp://ftp.linux-mips.org/pub/linux/mips/people/ths/mips-prelinker-patches-
debian/


Thiemo
