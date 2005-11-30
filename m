Received: from smtp102.biz.mail.re2.yahoo.com ([68.142.229.216]:41334 "HELO
	smtp102.biz.mail.re2.yahoo.com") by ftp.linux-mips.org with SMTP
	id S8133839AbVK3RP5 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 30 Nov 2005 17:15:57 +0000
In-Reply-To: <17AB476A04B7C842887E0EB1F268111E027190@xpserver.intra.lexbox.org>
References: <17AB476A04B7C842887E0EB1F268111E027190@xpserver.intra.lexbox.org>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <cf72b856706166dfcfc3de18af976400@embeddedalley.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddedalley.com>
Subject: Re: DbAu1550 copy file corruption
Date: Wed, 30 Nov 2005 11:27:16 -0500
Return-Path: <dan@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Sanchez <david.sanchez@lexbox.fr>
Cc: linux-mips@linux-mips.org
Message-ID: <20051130162716.sldcIsAvQmH9oFJEF3kj2GRgv4MkoR6JRPDChol0T6I@z>


On Nov 30, 2005, at 5:14 AM, David Sanchez wrote:

> On my DbAu155 + Sata HDD on PDC20579 + Linux Kernel 2.6.10 + busybox

Are you sure your disk interface is working properly?
Have you tested this on an NFS partition?  Does
the on-board HPT371 work?  I know the latter two
used to work, but I don't remember testing a 2.6.10
kernel, I've been using newer ones.


	-- Dan
