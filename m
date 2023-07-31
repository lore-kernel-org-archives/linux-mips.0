Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7CDC001DE
	for <linux-mips@archiver.kernel.org>; Mon, 31 Jul 2023 20:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjGaUgM (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 31 Jul 2023 16:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjGaUgL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 16:36:11 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1890D1BC6
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 13:36:06 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4036bd4fff1so80561cf.0
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 13:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690835765; x=1691440565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WbRt22akgzv4PmYRoTv7Z60VgxgxYtdGWVmvWN3QQU=;
        b=S48GXM2S/zOssa/4HGYWA/fi14zXxpeMV2F4C7CVir22G8F1rsCFPMpbbATKKTGtDB
         64U04V9zqc3NX/KcDqqznzevwdH+LBQzjjWkXhUJhWjREYzmjnwgZfC3FYc5IrYNUBlm
         LY/EUvpLCfaeKdgtW8bCez7DItwI3/PYoIvy7INGK7YD0YSomsBbivsNBTVfKNu4nBdo
         xivL5QLBIY+NVve5Wz1jLiXbHQ5tlLXN7oYO0s/LfS46XwncPU8xO8zWDxBIMO3Easl+
         guS7RQ3/hKev8L86c/bpFnn92PLQF1TIWg60T0w21WW/l5BAv1hI0kYaSnXEA5R3MsmC
         +C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835765; x=1691440565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WbRt22akgzv4PmYRoTv7Z60VgxgxYtdGWVmvWN3QQU=;
        b=bXKNY3WOmIx7aXr23kMDDrcn8P1SlkDkIKoRlleSj53y8EOChv0CF2YvgvkeWub9lV
         sYYsCbuwRVVyFDgPzxEFhqIS8hYk2zuW0rgEDAHhBf0GRikVYY3RANBxlapZPfz2TBbo
         pqRJmd0SVoWdn81Gd+76zEphZcgCAIccdRDtcrFSOSZD7igYlYS4AiELlMjVeear9RoK
         OrGEkZc+1P6UuTU46g6EMRIW+aO7r1tsZm33pWkqFEiyFAs4I9rqJJ9fB84RRHbcx1in
         A3Ehw2BF/DPbdn+cRnL+MGF69g6rSna4aoL8EK3nWsYLaCtueOnT+1MeRfuPl7r0gPyr
         il6Q==
X-Gm-Message-State: ABy/qLYewkHl0ncmNUpDoPn4uZv5HVsSthPW0FyQbXcDUHM11h8sG1oE
        dNcCpaehueCc183sX4a/jwzxlvQh5+7S8ZfN+hVzQA==
X-Google-Smtp-Source: APBJJlEmoOsErptso+JLUNi7GHGxX5qEgT6biVyV0lbNK73KMKgCiYEb0JJeNHAmZZOJJPW+PoidP5ENk119vh3duf0=
X-Received: by 2002:ac8:7f02:0:b0:407:4aa8:c5ba with SMTP id
 f2-20020ac87f02000000b004074aa8c5bamr366494qtk.14.1690835765004; Mon, 31 Jul
 2023 13:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230729004144.1054885-1-seanjc@google.com>
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 31 Jul 2023 14:35:29 -0600
Message-ID: <CAOUHufaK1zibYzOxUGWgYatLnts+fOG6X8fBAwtGA_S6cdDxMw@mail.gmail.com>
Subject: Re: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 28, 2023 at 6:41=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events ca=
n
> pass event specific information up and down the stack without needing to
> constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
> around a bitmap, and support for memory attributes will pass around the
> new attributes for the range.
>
> Add a "KVM_NO_ARG" placeholder to simplify handling events without an
> argument (creating a dummy union variable is midly annoying).
>
> Opportunstically drop explicit zero-initialization of the "pte" field, as
> omitting the field (now a union) has the same effect.
>
> Cc: Yu Zhao <yuzhao@google.com>
> Link: https://lore.kernel.org/all/CAOUHufagkd2Jk3_HrVoFFptRXM=3DhX2CV8f+M=
-dka-hJU4bP8kw@mail.gmail.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Yu Zhao <yuzhao@google.com>
