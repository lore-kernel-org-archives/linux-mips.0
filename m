Return-Path: <SRS0=/1XN=2I=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF16BC43603
	for <linux-mips@archiver.kernel.org>; Wed, 18 Dec 2019 15:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75ACF206CB
	for <linux-mips@archiver.kernel.org>; Wed, 18 Dec 2019 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576683027;
	bh=VoDZA28QIA8ZuEkr4fUTI8rp1iZfr1x38wiooqnNZsw=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:List-ID:From;
	b=fFUNO5SGZYq5HJmF3kC7RFzuOB7LvqWnTx5q0OEZaAY8DM1crpCaz7HAN1OzxQXyw
	 50ivjEZJ3UqrxLXfFVoaVVFLn7JAHf7cGyfbr4heGff/papQZ2tTepIju6DqRtqezr
	 P5LlQoDrMQ+5f9TwUSMZDA35AtSc1r5qa8GGAlpk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfLRPa1 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 18 Dec 2019 10:30:27 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:35235 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727001AbfLRPa1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Dec 2019 10:30:27 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1ihbH2-0003tk-7u; Wed, 18 Dec 2019 16:30:04 +0100
To:     James Morse <james.morse@arm.com>
Subject: Re: [PATCH 7/7] KVM: arm/arm64: Elide CMOs when unmapping a range
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Dec 2019 15:30:04 +0000
From:   Marc Zyngier <maz@kernel.org>
Cc:     Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Ra?= =?UTF-8?Q?dim_Kr=C4=8Dm=C3=A1=C5=99?= 
        <rkrcmar@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-mips@vger.kernel.org>,
        <kvm-ppc@vger.kernel.org>, <kvm@vger.kernel.org>
In-Reply-To: <0c832b27-7041-a6c8-31c0-d71a25c6f5b8@arm.com>
References: <20191213182503.14460-1-maz@kernel.org>
 <20191213182503.14460-8-maz@kernel.org>
 <0c832b27-7041-a6c8-31c0-d71a25c6f5b8@arm.com>
Message-ID: <de462fe29fb40fb1644e6a071e6c0c69@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com, jhogan@kernel.org, paulus@ozlabs.org, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi James,

On 2019-12-18 15:07, James Morse wrote:
> Hi Marc,
>
> On 13/12/2019 18:25, Marc Zyngier wrote:
>> If userspace issues a munmap() on a set of pages, there is no
>> expectation that the pages are cleaned to the PoC.
>
> (Pedantry: Clean and invalidate. If the guest wrote through a device
> mapping, we ditch any clean+stale lines with this path, meaning 
> swapout
> saves the correct values)

Indeed.

>> So let's
>> not do more work than strictly necessary, and set the magic
>> flag that avoids CMOs in this case.
>
> I think this assumes the pages went from anonymous->free, so no-one
> cares about the contents.
>
> If the pages are backed by a file, won't dirty pages will still get
> written back before the page is free? (e.g. EFI flash 'file' mmap()ed 
> in)

I believe so. Is that a problem?

> What if this isn't the only mapping of the page? Can't it be swapped
> out from another VMA? (tenuous example, poor man's memory mirroring?)

Swap-out wouldn't trigger this code path, as it would use a different
MMU notifier event (MMU_NOTIFY_CLEAR vs MMU_NOTIFY_UNMAP), I believe.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
