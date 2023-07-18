Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2200FC001DC
	for <linux-mips@archiver.kernel.org>; Tue, 18 Jul 2023 14:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbjGROpo (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 18 Jul 2023 10:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbjGROpn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 10:45:43 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CA9FD;
        Tue, 18 Jul 2023 07:45:41 -0700 (PDT)
Received: from [IPV6:2001:861:4a40:8620:abaf:bd59:1866:36ef] (unknown [IPv6:2001:861:4a40:8620:abaf:bd59:1866:36ef])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E6226607021;
        Tue, 18 Jul 2023 15:45:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689691539;
        bh=vq5QYdftC25wRARBmFsUqQVoZPb1UNzjuDtHO7keXpw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=X+8zDm+UUf/2VhSlJECgfA8kkyWnB/hMC6RFx/rQnExW7Jg/S7M+dPNzeodD9CNa3
         7Zptf7kD3gXsM6jptnvjbZebiEJ8IyIDB5syO2WQWD9bXpSLpCoywsn7MsVYvsKaiq
         UtQIfIP4BYZRAc0jzdipST/1+QjHaJ8Xjysv1YthVjq97Oxbs4ukLOXi+mlGnjsTMI
         giuDjdjNIfYkKF4kF5n2cvSTkAlonzz0ED8gptByfd081GMTYQZDKm2sdpAXjX+JfQ
         ObiOAkI21uYiZCzDgLGseXYM2uidrzHhNpXUGjXS0zyeV+0MQkp2K9EjApdo03VUtr
         dx4YW+S3phf8g==
Message-ID: <83ac823f-eca4-9dda-c692-55b7a16bcc1e@collabora.com>
Date:   Tue, 18 Jul 2023 16:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] MIPS: Only fiddle with CHECKFLAGS if `need-compiler'
Content-Language: en-US
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jan-Benedict Glaw <jbglaw@lug-owl.de>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
References: <alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk>
 <alpine.DEB.2.21.2307181421010.61566@angie.orcam.me.uk>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <alpine.DEB.2.21.2307181421010.61566@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Please also mention the KernelCI bot as this was initially found
thanks to an automated email report:

On 18/07/2023 16:37, Maciej W. Rozycki wrote:
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Reported-by: "kernelci.org bot" <bot@kernelci.org>

Thanks,
Guillaume

