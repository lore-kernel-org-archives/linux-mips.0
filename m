Received: from mailapp01.imgtec.com ([195.59.15.196]:34938 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27040881AbcEaMSeZNJ-i (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 May 2016 14:18:34 +0200
Subject: Re: [PATCH] MIPS: lib: Mark intrinsics notrace
References: <20160525100635.22541-1-harvey.hunt@imgtec.com>
 <20160529210340.GA25587@linux-mips.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <eab5a895-a174-9d2c-16ba-f660c04190ba@imgtec.com>
Date: Tue, 31 May 2016 13:18:28 +0100
MIME-Version: 1.0
In-Reply-To: <20160529210340.GA25587@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, "# 4 . 2 . x-" <stable@vger.kernel.org>
Message-ID: <20160531121828.6k4ogARWtv0fO9jBkFZJ-_9AuJQ5DVT_BSyKSpxQOe4@z>

Hi Ralf,

On 29/05/16 22:03, Ralf Baechle wrote:
> On Wed, May 25, 2016 at 11:06:35AM +0100, Harvey Hunt wrote:
>
>> On certain MIPS32 devices, the ftrace tracer "function_graph" uses
>> __lshrdi3() during the capturing of trace data. ftrace then attempts to
>> trace __lshrdi3() which leads to infinite recursion and a stack overflow.
>> Fix this by marking __lshrdi3() as notrace. Mark the other compiler
>> intrinsics as notrace in case the compiler decides to use them in the
>> ftrace path.
>
> Makes perfect sense - but I'm wondering how you triggered it.  Was this
> a build with the GCC option -Os that is CONFIG_CC_OPTIMIZE_FOR_SIZE?
> Usually people build with CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE that is -O2
> which results in intrinsics being inlined.

This is triggered by building with CONFIG_CC_OPTIMIZE_FOR_SIZE. This 
explains why I only saw it on certain MIPS32 devices - Malta's 
defconfigs don't have CONFIG_CC_OPTIMIZE_FOR_SIZE enabled, but the 
pistachio and Ci20 defconfigs do.

>
>   Ralf
>

Thanks,

Harvey
