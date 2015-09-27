Received: from mail-bl2on0073.outbound.protection.outlook.com ([65.55.169.73]:37696
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27008536AbbI0UjRSxYKS (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 27 Sep 2015 22:39:17 +0200
Message-ID: <560853E6.7050902@caviumnetworks.com>
Date: Sun, 27 Sep 2015 13:39:02 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] perf tools: Add MIPS userspace DWARF callchains.
References: <cover.1428450297.git.ralf@linux-mips.org> <20150927160419.GA8529@debian>
In-Reply-To: <20150927160419.GA8529@debian>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rabin Vincent <rabin@rab.in>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, Jiri Olsa <jolsa@redhat.com>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Message-ID: <20150927203902.LVIDGRQswXDdNWaExJR-TzbEBoAYYpTiL46COQXgpj0@z>

On 09/27/2015 09:05 AM, Rabin Vincent wrote:
> On Wed, Apr 08, 2015 at 01:58:45AM +0200, Ralf Baechle wrote:
>> This is a refresh of a David Daney's patch set to implement MIPS support
>> for perf.  It has been posted before but not received any comments or
>> (N)Acks.
>>
>> This series depends on
>>
>>    http://patchwork.linux-mips.org/patch/5246/
>>
>> which currently is pending for 4.1 in the MIPS tree so I'd like to upstream
>> these two patches through the MIPS tree as well.
>
> Looks like this "MIPS: Add user stack and registers to perf" patch
> didn't get merged in 4.1?  Could it please be queued now?
>
>>
>> David's original patches are archived at:
>>
>>    http://www.linux-mips.org/cgi-bin/mesg.cgi?a=linux-mips&i=1368817238-11548-1-git-send-email-ddaney.cavm%40gmail.com
>>    http://patchwork.linux-mips.org/patch/5249/
>>    http://patchwork.linux-mips.org/patch/5250/
>
> I've taken these tools/perf patches and made them work with the latest
> mainline (this addresses the comments Jiri had) and can send them out if
> you'd like, but they need the arch/mips patch to build.
>

FWIW: I don't have time to work on these at the moment, but I still 
support merging them.  If anybody wants to take the time to get them 
into a mergable state, I would fully support, and bless, that effort.

Thanks,
David Daney
