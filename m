Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BC2C433ED
	for <linux-mips@archiver.kernel.org>; Tue,  6 Apr 2021 06:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19E2C613C3
	for <linux-mips@archiver.kernel.org>; Tue,  6 Apr 2021 06:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhDFGFx (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 6 Apr 2021 02:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232147AbhDFGFw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 02:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617689145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=438n2iekob+JtljwuNE0nR9jiXz0o9aFbj9Xm8ulZ9s=;
        b=KlbiybKBn7geiT23UizOLStwT2mL0AZmDTGlU1Rx2kOUhvqp7XQ75GdEyXd7NOQZpCW/vZ
        yZDL9HOXxCLPRPA8VrQN61ozE4caGjcrom8JkYzkqdKa/EGz9QwjITPc46g4NKYJ7PsVhX
        rQuZNfMm1b6lAYLhtoK3oISW2wNvU+E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-iLXnDz4EPi6ggBZCTnsNWg-1; Tue, 06 Apr 2021 02:05:42 -0400
X-MC-Unique: iLXnDz4EPi6ggBZCTnsNWg-1
Received: by mail-ej1-f71.google.com with SMTP id k26so1409279ejs.5
        for <linux-mips@vger.kernel.org>; Mon, 05 Apr 2021 23:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=438n2iekob+JtljwuNE0nR9jiXz0o9aFbj9Xm8ulZ9s=;
        b=feswnxriQVz8pAPwCBIr8ZiDTvKWMnhQ2wsgLRQxjlRJuJzVvAHmnqYYqIoIqoy6hw
         O/XvGlE9lY7FrbRop6iRD9urrBeP6ya/o42gbdtSguYyOwm2k35doro1a9dVsB4PF8id
         hk9//7pBIP3wBtfqaS/kBv+IFMvj86fAB6wP5+08+CYro1xeQvxQihwxWsmXOHrRzlUm
         EVnWTPcAICJIcjz2uUZwXCe5arq0RAQvLqT+SDyaykF0BjJ6wwzW1j24uoDUSoD2cnxj
         2MiT8DKLKIgPXi6AOEh+jF02Po2WuQRXK+VsRx9bPRVozNQLxEMAoetDD2+5UmhM/YYi
         IWhw==
X-Gm-Message-State: AOAM530Zkyw1TGGblkqn0/y1RfnwwoFaQhuptPwDPp+9ltjrncoyfNAG
        UhnliKBUwQpcKhqI8FuBtXSxwrDaYNj5oVCNVfscmwBu50g2t/49X7rdKomm9AoDIoP5dZaz1X5
        UMZviWca9UYRJz8sxRKxUIA==
X-Received: by 2002:aa7:dd05:: with SMTP id i5mr35528032edv.300.1617689141723;
        Mon, 05 Apr 2021 23:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeSXQqMyBxAbWNuqiAxTvmAGWEq1pKGvAj5/3y0/o4g7G74ZQxI9YjrUKSrMh/jG+PrH5fxw==
X-Received: by 2002:aa7:dd05:: with SMTP id i5mr35528012edv.300.1617689141565;
        Mon, 05 Apr 2021 23:05:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id x9sm13118850edv.22.2021.04.05.23.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 23:05:41 -0700 (PDT)
Subject: Re: [PATCH 2/4] KVM: MIPS: rework flush_shadow_* callbacks into one
 that prepares the flush
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        seanjc@google.com, "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20210402155807.49976-1-pbonzini@redhat.com>
 <20210402155807.49976-3-pbonzini@redhat.com>
 <CAAhV-H4wskLvGD1hhuS2ZDOBNenCcTd_K8GkYn1GOzwnEvTDXQ@mail.gmail.com>
 <aab8a915-6e73-3cba-5392-8f940479a011@redhat.com>
 <CAAhV-H72z9DbbV=_fEhCeeOaP8fQ_qtr4rQMD=f5n08ekG=Ygw@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <510e59e7-91b0-6754-8fb5-6a936ef47b3c@redhat.com>
Date:   Tue, 6 Apr 2021 08:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H72z9DbbV=_fEhCeeOaP8fQ_qtr4rQMD=f5n08ekG=Ygw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/04/21 03:36, Huacai Chen wrote:
>> I tried the merge and it will be enough for Linus to remove
>> arch/mips/kvm/trap_emul.c.  So I will leave it as is, but next time I'd
>> prefer KVM MIPS changes to go through either my tree or a common topic
>> branch.
> Emmm, the TE removal series is done by Thomas, not me.:)

Sure, sorry if the sentence sounded like it was directed to you.  No 
matter who wrote the code, synchronization between trees is only the 
maintainers' task. :)

Paolo

