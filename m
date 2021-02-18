Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC53C433E0
	for <linux-mips@archiver.kernel.org>; Thu, 18 Feb 2021 06:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F393F64E2F
	for <linux-mips@archiver.kernel.org>; Thu, 18 Feb 2021 06:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBRGQI (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 18 Feb 2021 01:16:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45456 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231997AbhBRGHF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Feb 2021 01:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613628320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I4q+YxVSVW16DE0+d+Y+BYB1zXwlSir3yUCLZoTFOt0=;
        b=A76W3x/CdJM6JkRrA0Hma9N2NumsfVZquFLawAFapLZniQEU+dv8N3u2/sf1Ob/aK2Wifa
        sWM0SjJftBt/tjqGwjy69UETknZiDiTVdlCxEroSuQZMWQmJ0/NEQeWLnBCW3EqlM3hAXI
        kNGXtJdHoh35plELRDb0ORyCdrbSrGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-PZmTWchaOh2HvEa0I-vBkg-1; Thu, 18 Feb 2021 01:05:15 -0500
X-MC-Unique: PZmTWchaOh2HvEa0I-vBkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C659E801965;
        Thu, 18 Feb 2021 06:05:12 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BFAFC6A03D;
        Thu, 18 Feb 2021 06:05:00 +0000 (UTC)
Subject: Re: [PATCH] arm64: defconfig: enable modern virtio pci device
To:     Arnd Bergmann <arnd@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-xtensa@linux-xtensa.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20210210190506.1923684-1-anders.roxell@linaro.org>
 <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <fffdfa8f-38c1-6fd1-d043-8a4f476213dc@redhat.com>
Date:   Thu, 18 Feb 2021 14:04:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/2/11 下午7:52, Arnd Bergmann wrote:
> On Wed, Feb 10, 2021 at 8:05 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>> Since patch ("virtio-pci: introduce modern device module") got added it
>> is not possible to boot a defconfig kernel in qemu with a virtio pci
>> device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
>> to boot.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>> ---
>>   arch/arm/configs/multi_v7_defconfig         | 1 +
>>   arch/arm64/configs/defconfig                | 1 +
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Michael, can you pick this up in the vhost tree that introduces the regression?
>
>           Arnd
>

Hi:

Based on the discussion previously, the plan is to select 
VIRTIO_PCI_MODERN, and document the module that select it must depend on 
PCI.

I will post a patch soon.

Thanks

