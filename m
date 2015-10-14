Received: from mailapp01.imgtec.com ([195.59.15.196]:22889 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009438AbbJNMzdCQYmC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Oct 2015 14:55:33 +0200
Subject: Re: mips VDSO
References: <20150909164309.GB27534@fifo99.com> <55F13BDA.3030304@imgtec.com>
 <20151014124438.GA15821@fifo99.com>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <561E50BE.3010605@imgtec.com>
Date: Wed, 14 Oct 2015 13:55:26 +0100
MIME-Version: 1.0
In-Reply-To: <20151014124438.GA15821@fifo99.com>
Content-Type: text/plain; charset="windows-1252"
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
To: dwalker@fifo99.com
Cc: alex.smith@imgtec.com, linux-mips@linux-mips.org
Message-ID: <20151014125526.PbkEKv7aLUl7NubO0fXhTMDl3YyTTKlriwaJTnB7uBI@z>

On 10/14/2015 01:44 PM, dwalker@fifo99.com wrote:
> On Thu, Sep 10, 2015 at 09:14:18AM +0100, Markos Chandras wrote:
>> On 09/09/2015 05:43 PM, dwalker@fifo99.com wrote:
>>> Hi,
>>>
>>> I was wondering if you've made any progress on this? I was also interested in implementing a faster gettimeofday()
>>> for mips.
>>>
>>> Daniel
>>>
>> Hi,
>>
>> I am currently reviewing Alex's VSDO implementation and I will post it
>> to this list within the next couple of weeks.
> 
> Did you an Alex finalize the VDSO implementation ?
> 
> Daniel
> 

I have submitted the kernel patches to that last a few weeks ago. I am
waiting for them to be merged before I submit the libc part of it.

-- 
markos
