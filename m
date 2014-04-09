Received: from mailapp01.imgtec.com ([195.89.28.114]:33645 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6815804AbaDIJKMFwNk6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Apr 2014 11:10:12 +0200
Message-ID: <53450E7E.1020700@imgtec.com>
Date: Wed, 9 Apr 2014 10:10:22 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: Remove last traces of SMTC Support too?
References: <1397033309.22767.8.camel@x220> <53450BBE.7050501@imgtec.com> <1397034201.22767.15.camel@x220>
In-Reply-To: <1397034201.22767.15.camel@x220>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20140409091022.Uom6FigU91FziOhpmUdJGyzCniD3tYb1b0a4Ez10-XQ@z>

On 04/09/2014 10:03 AM, Paul Bolle wrote:
> Hi Markos,
>
> On Wed, 2014-04-09 at 09:58 +0100, Markos Chandras wrote:
>> I talked to Ralf yesterday. It seems the patch was not applied correctly
>> and there are a few traces left. My original patch definitely removes
>> the traces listed in your patch.
>
> Assuming Ralf and you sort this out, and a complete removal of SMTC
> support will eventually hit linux-next, I won't be bothering you again.
>
> Thanks,
>
>
> Paul Bolle
>
Hi Paul,

As James pointed out, it seems there are a few traces of SMTC left even 
with my original patch. I will make sure everything is gone in time though.

-- 
markos
