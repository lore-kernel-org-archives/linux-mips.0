Received: from sj-iport-1.cisco.com ([171.71.176.70]:28993 "EHLO
	sj-iport-1.cisco.com") by lappi.linux-mips.net with ESMTP
	id S525971AbYDBV6B (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 2 Apr 2008 23:58:01 +0200
Message-ID: <47F4011F.9020604@cisco.com>
Date: Wed, 02 Apr 2008 14:56:47 -0700
From: David VomLehn <dvomlehn@cisco.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2.6.24][MIPS]Work in progress: fix HIGHMEM-enabled dcache
 flushing on 32-bit processor
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Jon Fraser [jfraser"@broadcom.com, linux-mips@linux-mips.org
Message-ID: <20080402215647.GxlDtN2DvTQ85aZaeHzNggzH64JTn2ujdXyrDWUREgE@z>

> Did this fix your NFS problem?
> 
> I'm working on discontiguous memory platforms as well.
> 
> Jon Fraser
> 
> On Wed, 2008-03-12 at 19:31 -0700, David VomLehn wrote:
>> This patch is a work in progress, per Ralf's suggestion from last 
>> week. It is intended to fix dcache flushing issues when using HIGHMEM 
>> support. We get much better results with this patch applied, but I 
>> would not characterize our 2.6.24 port as stable, yet, so there may be other HIGHMEM-related issues.

Yes, we are able to boot using NFS with this patch. There are some other minor 
changes that appear necessary for correct cache flushing but which don't seem to 
be causing any actual issues. (Cache stuff just works that way--you don't know 
you've got a problem until you get into some obscure corner case). I'll post 
these as soon as I can get to it.

I can't say whether these are all the changes required for high memory support, 
but we sure get a lot farther when we use them...
-- 
David VomLehn, dvomlehn@cisco.com
The opinions expressed herein are likely mine, but might not be my employer's...
