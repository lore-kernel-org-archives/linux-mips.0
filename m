Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAC7C4332F
	for <linux-mips@archiver.kernel.org>; Tue, 18 Oct 2022 09:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiJRJ4M (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 18 Oct 2022 05:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiJRJ4M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Oct 2022 05:56:12 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E6DA2A85;
        Tue, 18 Oct 2022 02:56:10 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id F0640240010;
        Tue, 18 Oct 2022 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1666086969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UUYw5ppAKogS4p3St4Ga/MgVfoaYufWQGcRDVb97qfA=;
        b=SRmPPsZpF1XW3VHAFV6EIlidS/8R89kNtuo3tdgbaG0be5VeeesLMWOUxLeJdIbl6NEqQJ
        iqs/MStUw0INdWVwfAScgHsDurTITE96f1A+kBDB1gOCnIDew4KdosX2UfWOSSXD5DP018
        sG0cj58MGrKe1e4jtgVHZyHZ1A1cJa+5DtiZAfAe4pL2xRGR+HMY5Z/vxM2WtKMSJozRaN
        2y5jgfCgayP9VVjqYZ7ujCsmvWlfvCuotYRy91JBDzGYIbbhXUM0v4rhSgqPfuus6Y1bAm
        3QlwrO0UKCiJc6iLjpdFT/aUvYgmL1874MLiJkmVaIcndpUyeFQQBNR4AuJK+A==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        John Crispin <john@phrozen.org>,
        =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date:   Tue, 18 Oct 2022 11:56:05 +0200
Message-Id: <20221018095605.543203-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015092950.27467-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'82d284a21963aa39385842db46b674bf80414eff'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 2022-10-15 at 09:29:49 UTC, =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Most TP-Link home routers use the same partitioning system based on a
> custom ASCII table.
> 
> It doesn't seem to have any official name. GPL sources contain tool
> named simply "make_flash" and Makefile target "FlashMaker".
> 
> This partitions table format was first found in devices with a custom
> SafeLoader bootloader so it was called SafeLoader by a community. Later
> it was ported to other bootloaders but it seems the name sticked.
> 
> Add binding for describing flashes with SafeLoader partitions table. It
> allows operating systems to parse it properly and register proper flash
> layout.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
