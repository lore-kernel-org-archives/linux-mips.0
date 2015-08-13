Received: from mailapp01.imgtec.com ([195.59.15.196]:38526 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011540AbbHMIZ4wh0qh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 13 Aug 2015 10:25:56 +0200
Subject: Re: VDSO
References: <55CB1E0C.4070405@imgtec.com> <55CB70EE.4080802@gmail.com>
From: Alex Smith <alex.smith@imgtec.com>
Message-ID: <55CC548E.6090407@imgtec.com>
Date: Thu, 13 Aug 2015 09:25:50 +0100
MIME-Version: 1.0
In-Reply-To: <55CB70EE.4080802@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Alex.Smith@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20150813082550.m-aIHcUpJRELLXQeO997EXLP_2b3LPm-ll9ki7tnENc@z>

On 12/08/2015 17:14, David Daney wrote:
> On 08/12/2015 03:21 AM, Alex Smith wrote:
>> Hi,
>>
>> I'm intending to start work on a proper VDSO implementation for MIPS that can provide user implementations of gettimeofday() and such, as well as take over from the current signal return trampoline code.
>>
>> Just wondering if there's anyone else who's doing any work towards this so we can avoid duplication of effort if so?
>>
> 
> I am not working on it, but have a small laundry list of what could be done:
> 
> 1) Perhaps the VA of the vdso needs to be randomized.
> 
> 2) Provide proper .eh_frame data for the signal return trampolines.
> 
> 3) gettimeofday (as you suggest).

Yes, I intend to do all of these.

> 4) Provide optimized versions of memcpy, etc.

Is this something that belongs in a VDSO? memcpy and friends aren't syscalls, this belongs in libc IMO. ELF HWCAP flags provided by the kernel could be used by libc to decide which CPU features it can make use of to implement them.

Thanks,
Alex

> 
> David Daney
> 
> 
