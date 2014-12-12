Received: from mailapp01.imgtec.com ([195.59.15.196]:27433 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006871AbaLLJNeyhV7w (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 12 Dec 2014 10:13:34 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id BB42934CFF29F
        for <linux-mips@linux-mips.org>; Fri, 12 Dec 2014 09:13:26 +0000 (GMT)
Message-ID: <548AB1B8.7040503@imgtec.com>
Date: Fri, 12 Dec 2014 09:13:28 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS in 3.19
References: <20141211132746.GF31723@linux-mips.org> <CAJiQ=7C=WTzOKJ4CPGH3zB4hTr=RkF1ywn9bHs2DXpPRmwpCKg@mail.gmail.com> <20141211212240.GA6477@linux-mips.org> <548A4ACC.9050106@gmail.com>
In-Reply-To: <548A4ACC.9050106@gmail.com>
Content-Type: text/plain; charset="utf-8"
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
To: linux-mips@linux-mips.org
Message-ID: <20141212091328.e9rt8VcBPMfwMPsKVl46Nvr1THX3nrIuGFkho65GlAQ@z>

On 12/12/2014 01:54 AM, Florian Fainelli wrote:
> On 11/12/14 13:22, Ralf Baechle wrote:
>> On Thu, Dec 11, 2014 at 11:19:53AM -0800, Kevin Cernekee wrote:
>>
>>> On Thu, Dec 11, 2014 at 5:27 AM, Ralf Baechle <ralf@linux-mips.org> wrote:
>>>>
>>>> Kevin Cernekee (15):
>>>>       Documentation: DT: Add entries for BCM3384 and its peripherals
>>>
>>>>       MIPS: bcm3384: Initial commit of bcm3384 platform support
>>>>       MAINTAINERS: Add entry for BCM33xx cable chips
>>>
>>> Hi Ralf,
>>>
>>> Could we drop/revert these three patches for now, and then use the
>>> "BMIPS Generic target V4" patch series to support BCM3384?  The BMIPS
>>> Generic series incorporates a great deal of helpful feedback from Arnd
>>> and others, and it also runs on 5+ other chips.
>>>
>>> It is OK if it isn't merged until 3.20+.  No rush.
>>
>> Too late - the pull request to Linus is out.
> 
> Ralf, you applied the patches without email notice, Kevin asked you to
> drop them way before sending a pull request while he was posting v2-3-4
> of his patch set, and now he has to deal with potential reverts, this is
> counter productive.
> 
> I do not see the MIPS pull request anywhere in public email archives, so
> we could not even say "wait" before this went out to Linus.
> --
> Florian
>

I am a little confused as well. Sometimes the pull requests appear on
LMO, some other times they don't. Would it be possible to CC LMO every
time a pull request is sent to Linus so we have time to review it (more
pair of eyes is not a bad thing) and comment on it if needed?

-- 
markos
