Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA94CC433FE
	for <linux-mips@archiver.kernel.org>; Tue, 15 Nov 2022 00:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236735AbiKOAqg (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 14 Nov 2022 19:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbiKOAqd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Nov 2022 19:46:33 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EC31DA6E
        for <linux-mips@vger.kernel.org>; Mon, 14 Nov 2022 16:46:30 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id v28so12633049pfi.12
        for <linux-mips@vger.kernel.org>; Mon, 14 Nov 2022 16:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bd5hPyKD2PPr7KyKwYzFS26oIX92ytADq1HkbV02UjM=;
        b=O1sOJD8rtP4IH4Yi70eGOrg+RsIrPwaSI+E7lsjchaR0vsIk4OcsTePfrD0GDQ6/ok
         MQcEhTNegM2MgZX6an+q4qFrc0TLFQKTcxlB5byx9V2OQmw/yqG2IxrUKZ4LJpkwjbqV
         kpXYCE/q5gMp8Dr+etmQpZD5YdgbXCRcIi4dP1hseJ3Vc8FgbnoFeQgznEsFCZ8sc9C/
         +Aq7UmleDQFCoHsOpxUqFAILq0h693d7cSqfrvEGcQEJdSL70r75p1CQVdbYcraVP6Vv
         afDwyZksFmO4iq1RAE78LdBL2zCtVUGqKVr5AbYHWRKQe4sZ3haM6vxe+yhoW+EegNn8
         SrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bd5hPyKD2PPr7KyKwYzFS26oIX92ytADq1HkbV02UjM=;
        b=AWo0gmGJT9xoX8Tf8tHwSD0Ie9PjsWe6klWyKYDRhMTiXhlclM95vb4VNXs7k/ZY+U
         63KEtSAmasMNRJrxwydoIVFTXyQWh7FAy38evF5va1UNxlBrsJCY9vVlzdXFPakh2BED
         utYXvxQy1QhpKfIIPkgxRyCiLH1MozeY4KYE/U6FX6X7a0hchFj7YvBMxMNtAUsogfb7
         VmjXLxD8AQEPw/qAVOcee/nQuORApvjVwGczbv6lZIlSJ5lbW1fiPbo/8ygv0f7hTcuW
         QUzwL0v2van/9DsUmoXOHBuM7fDdFhA3uJcXFvK4VJIMnzUfZ57SxFy/XoqjHoYkhhIB
         Afbg==
X-Gm-Message-State: ANoB5pltk8RLSvXHWbeYF8t7VPMrLYgQfuz3TFQUeRSG4JSUJOVUc1Pt
        JtDgj3mfhWxTR9NgEvEmvcSyyA==
X-Google-Smtp-Source: AA0mqf6nOJ9c9LDWbjxDMBFuDEMN03fiqfa60Tgw1kwrGN5DHzLmvSOo+bF6ZKKp/POWOk+fWmlLwQ==
X-Received: by 2002:a63:ce04:0:b0:46f:1081:f517 with SMTP id y4-20020a63ce04000000b0046f1081f517mr14083794pgf.297.1668473190230;
        Mon, 14 Nov 2022 16:46:30 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:d6b2:571a:fff:f8d4])
        by smtp.gmail.com with ESMTPSA id s30-20020a17090a69a100b00217cdc4b0a5sm10323493pjj.16.2022.11.14.16.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 16:46:29 -0800 (PST)
Date:   Mon, 14 Nov 2022 16:46:25 -0800
From:   Fangrui Song <maskray@google.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Message-ID: <20221115004625.x4wl6zbg4iiuxl5t@google.com>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2022-11-14, Christophe Leroy wrote:
>
>
>Le 28/09/2022 à 07:25, Fangrui Song a écrit :
>> On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> wrote:
>>>
>>> On 2022-08-30, Fangrui Song wrote:
>>>> The actual intention is that no dynamic relocation exists. However, some
>>>> GNU ld ports produce unneeded R_*_NONE. (If a port is not care enough to
>>>> determine the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
>>>> relocations. E.g. powerpc64le ld as of 2.38 has the issue with
>>>> defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So just
>>>> ignore them.
>>>>
>>>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
>>>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
>>>> not called "absolute relocations". (The patch is motivated by the arm64
>>>> port missing R_AARCH64_RELATIVE.)
>>>>
>>>> While here, replace "egrep" with "grep" as "egrep" is deprecated in GNU
>>>> grep 3.7.
>>>>
>>>> Signed-off-by: Fangrui Song <maskray@google.com>
>>>> ---
>>>> [...]
>>>>
>>>
>>> Ping.
>>
>> Ping^2 :)
>
>Can you explain which ARCH_REL_TYPE_ABS can be removed with this change ?
>How is the verification done if ARCH_REL_TYPE_ABS is removed ?

All ARCH_REL_TYPE_ABS relocation types can be removed. As explained, the
real intention is to check no dynamic relocation, and this is done by
the new

   cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q "R_\w*_"; \

in this patch.

grep -v _NONE is to work around some GNU ld ports (and likely older releases
of some ports even if their latest versions are fixed) which produce
unneeded R_*_NONE dynamic relocations.
