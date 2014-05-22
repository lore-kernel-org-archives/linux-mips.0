Received: from mailapp01.imgtec.com ([195.59.15.196]:39884 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6855122AbaEVQRsW3gTm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 May 2014 18:17:48 +0200
Message-ID: <537E2290.900@imgtec.com>
Date: Thu, 22 May 2014 17:15:12 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 07/15] MIPS: Add mips_cpunum() function.
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-8-git-send-email-andreas.herrmann@caviumnetworks.com> <537C89B5.2030907@imgtec.com> <20140522161342.GI11800@alberich>
In-Reply-To: <20140522161342.GI11800@alberich>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140522161512.QsqZrWCHLbW7v5mYaflRoPQwrndDejnCxl2bTDEMr6Q@z>

On 22/05/14 17:13, Andreas Herrmann wrote:
> On Wed, May 21, 2014 at 12:10:45PM +0100, James Hogan wrote:
>> On 20/05/14 15:47, Andreas Herrmann wrote:
>>> +static inline unsigned int mips_cpunum(void)
>>> +{
>>> +	return read_c0_ebase() & 0x3ff; /* Low 10 bits of ebase. */
>>> +}
>>
>> If this is going to go in mips generic code I think it should be clearly
>> defined, especially in the presence of MT, otherwise perhaps it makes
>> sense for it to go in a paravirt specific header?
> 
> It's just wrapper to read ebase_cpunum. Currently only used in the
> paravirt-code (to get CPUnum for a guest CPU -- which eventually is
> read from guest cp0 context).
> 
> I am not sure whether it needs to be moved to a paravirt specific
> header.
> 
>> I.e. does it return the core number of the running VPE (if so it should
>> probably do something like below as in decode_configs() and go in
>> smp.h), or does it simply always return that field in ebase register (in
>> which case it should probably have ebase in the name and a comment to
>> clarify that it doesn't necessarily map directly to core/vpe number).
> 
> Under KVM (MIPSVZ) it effectively returns vcpu_id and thus such a
> comment could be added for clarification.
> 
> So, should we name it get_ebase_cpunum() but keep it in this header
> (and also replace the 1 or 2 occurrences of "read_c0_ebase() & 0x3ff"
> in the non-paravirt code with it)?

That sounds reasonable to me.

Cheers
James
