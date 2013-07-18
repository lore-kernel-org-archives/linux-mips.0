Received: from mail-bn1lp0156.outbound.protection.outlook.com ([207.46.163.156]:51782
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6827417Ab3GRUhpUq-7F (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 18 Jul 2013 22:37:45 +0200
Message-ID: <51E8520E.2050604@caviumnetworks.com>
Date: Thu, 18 Jul 2013 13:37:34 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips/ftrace: Fix function tracing return address to match
References: <1373926637-24627-1-git-send-email-ddaney.cavm@gmail.com>  <1374178262.6458.266.camel@gandalf.local.home> <51E84CBC.80206@gmail.com> <1374179160.6458.269.camel@gandalf.local.home>
In-Reply-To: <1374179160.6458.269.camel@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: Steven Rostedt <rostedt@goodmis.org>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, Corey Minyard <cminyard@mvista.com>, David Daney <david.daney@cavium.com>
Message-ID: <20130718203734.8zSrfvCFbC0nsOGJFMvp9T8v1Qip9D-_pOyedGmuqYM@z>

On 07/18/2013 01:26 PM, Steven Rostedt wrote:
> On Thu, 2013-07-18 at 13:14 -0700, David Daney wrote:
>
>> There is an mcount ABI difference based on which GCC version you are
>> using, although I wouldn't think it would effect this bit.
>>
>> We are using GCC-4.7 FWIW.
>>
>> David Daney
>
> I'm using 4.6.3 which I downloaded from
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/

I would expect that version to be fine too.  The option in question is 
-mmcount-ra-address, which I added to GCC-4.5

>
> I can down load the 4.7 version and see if that makes a difference.
>
> -- Steve
>
>
>
