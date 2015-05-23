Received: from mailapp01.imgtec.com ([195.59.15.196]:35805 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006688AbbEWACxdvEF7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 23 May 2015 02:02:53 +0200
Message-ID: <555FC32A.4020308@imgtec.com>
Date: Fri, 22 May 2015 17:00:42 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] MIPS: MSA: bugfix - disable MSA during thread switch
 correctly
References: <20150519211222.35859.52798.stgit@ubuntu-yegoshin> <20150519211351.35859.80332.stgit@ubuntu-yegoshin> <20150522093812.GH6941@linux-mips.org> <555F776E.3070904@imgtec.com> <20150522232019.GA10556@linux-mips.org>
In-Reply-To: <20150522232019.GA10556@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
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
Cc: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, paul.burton@imgtec.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150523000042.gFN5f85Ke0Rffz2GPOqWvUGqHgIN7wa0x5c0XdfwhwE@z>

On 05/22/2015 04:20 PM, Ralf Baechle wrote:
> On Fri, May 22, 2015 at 11:37:34AM -0700, Leonid Yegoshin wrote:
>
>> On 05/22/2015 02:38 AM, Ralf Baechle wrote:
>>> Just move the call to finish_arch_switch().
>> It might be a problem later, then a correct MSA partiton starts working. It
>> should be tight to saving MSA registers in that case.
>>
>>> Your rewrite also dropped the if (cpu_has_msa) condition from
>>> disable_msa() probably causing havoc on lots of CPUs which will likely not
>>> decode the set bits of the MFC0/MTC0 instructions thus end up accessing
>>> Config0. Ralf
>> Right before this chunk of code there is a saving MSA registers. Does it
>> causing a havoc or else?
>>
>> May I ask you to look into switch_to macro to figure out how "if
>> (cpu_has_msa)" check works in this case?
> Ah sorry I now see that your added code is not executed for all CPUs but
> only those having MSA.  So then it's safe.
>
> Still I don't stylistically like defining the register t4 in the middle
> of the code.
>
> Below my suggested patch.  It's advantage is that for non-MSA platforms
> the call to disable_msa() will be removed entirely.
>
> Something like Paul's http://patchwork.linux-mips.org/patch/10111/ (assuming
> it's correct and tested) seems like a full cleanup but it's way too
> complex for 4.1 or the stable kernels.
>
>    Ralf
>
>
All 3 patches seems working (I tested), but if you don't like mine then 
I prefer Paul's patch more - it concentrates stuff more closely and 
removes some assembly stuff.

Besides that, it introduces lose_fpu_inatomic() which is needed for me :)

- Leonid.
