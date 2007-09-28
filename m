Received: from cruel.tal.org ([195.16.220.85]:1676 "EHLO netra-ax.tal.org")
	by ftp.linux-mips.org with ESMTP id S20024008AbXI1Kdf (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 28 Sep 2007 11:33:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by netra-ax.tal.org (Postfix) with ESMTP id 3E5493466B
	for <linux-mips@linux-mips.org>; Fri, 28 Sep 2007 13:58:06 +0300 (EEST)
Received: from netra-ax.tal.org ([127.0.0.1])
 by localhost (netra-ax.tal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23991-01 for <linux-mips@linux-mips.org>;
 Fri, 28 Sep 2007 13:58:05 +0300 (EEST)
Received: from concertina (unknown [195.16.220.84])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by netra-ax.tal.org (Postfix) with ESMTP id 28C3934658
	for <linux-mips@linux-mips.org>; Fri, 28 Sep 2007 13:58:05 +0300 (EEST)
Message-ID: <003b01c801bb$00222910$54dc10c3@tal.org>
From: "Kaj-Michael Lang" <milang@tal.org>
References: <1190973427.11251.17.camel@scarafaggio>
Subject: Re: Tests of 2.6.23-rc8 on SGI O2
Date: Fri, 28 Sep 2007 13:33:22 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <milang@tal.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20070928103322.zI-3Ex9RE2u3HK5kiTxuejwS-U87DXWSNff1ZnrBC3k@z>

> B. recompiling with 8mb of frame buffer give an unusable display and
> fill my syslog of these messages:

This is nothing new, use 4mb.

-- 
Kaj-Michael Lang
