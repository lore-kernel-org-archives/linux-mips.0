Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846A6C433E0
	for <linux-mips@archiver.kernel.org>; Wed, 24 Feb 2021 07:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2372664ECF
	for <linux-mips@archiver.kernel.org>; Wed, 24 Feb 2021 07:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhBXH5m (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 24 Feb 2021 02:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbhBXH5Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 02:57:25 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBBBC061786;
        Tue, 23 Feb 2021 23:56:44 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w11so900447wrr.10;
        Tue, 23 Feb 2021 23:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hQJRhWVV1uzqfhk4zJj4G4Yp1KSigb4fRpUieYvH4gk=;
        b=M/7Cn0GGRU/RYy8H4+jdBRVsPitfGkfnVKNgjYs2pYT/jdPqG2sQKVh8vr1UvY3dhR
         s1CEVhovO1F3eXFuar67W7mv7t7vX2MRPbbYPBExpAGnkYDV6wgaUHJ8zL+LoPMAfChk
         dPGJ1HVmmwERYtfSzFxR1DBdJAHWqHRGk3PsBG6h9Dm6SCR/h5NIo6uD2aOg8zwOzvhX
         GKiAQ0B6YWBjhOMzmF1LAJXB5iYFh/mkGlt92yK3dencTueO4ZjLrMhMAaQy6Ajro2L7
         c1/AC75CfmTrgWoMdnM6uHuls+Va64AIW+8m9EBYJgh5qtr1PQJphG8U6HmaRAMUvZJV
         +1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hQJRhWVV1uzqfhk4zJj4G4Yp1KSigb4fRpUieYvH4gk=;
        b=VrOhmH1lFXYaliXWfdGQsjP7S14tRlAM4/7a6s20FqoQ95IwOvlUWvWxyXbjRd+yo0
         M8R72iGXIaAn4vSJDppBbQyCst+RMUbzuUYPBfeVB+/yDrxSbg9dCxWF37d8ThN10COD
         AVMbRhw0nMNaC0DjU+J0R41HVuT6ibZdxsct8dgpmEQKfOWJmExo3UvBY4EsO/nBt75p
         ldmubk5V2jbJi/qOIY4sFK3aAYt/+/p22RZXUhCCOFSVmHIJ6DsqHVd82Av0glHPPDxR
         WHXzvqZlvav4exN6ePpp2QpdWeYYYPgqCqzMND3y/VqLA/jfVtg695pMeveXuUI4xi9I
         RRaA==
X-Gm-Message-State: AOAM531IXo3K84g85ZuTTol7iA6cdmmbhuv8AKKPfELId1/IGa3frmPb
        p76zHPMJKIkmbBQ7Q155lW0=
X-Google-Smtp-Source: ABdhPJydg21LRFKCW4fzox0Dn3KlpJ0Vx1SCIRlaAwMsGwEunUbgqdPyn+0HKofkjTs6/vHPKRsDsg==
X-Received: by 2002:adf:fad2:: with SMTP id a18mr30110729wrs.147.1614153403032;
        Tue, 23 Feb 2021 23:56:43 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u7sm1954033wrt.67.2021.02.23.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 23:56:42 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: [PATCH v2 0/2] irqchip: add support for BCM6345 interrupt controller
Date:   Wed, 24 Feb 2021 08:56:38 +0100
Message-Id: <20210224075640.20465-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223204340.312-1-noltari@gmail.com>
References: <20210223204340.312-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This interrupt controller is present on bcm63xx SoCs in order to generate
interrupts based on GPIO status changes.

v3: pass dt_binding_check.
v2: fix documentation title typo.

Álvaro Fernández Rojas (2):
  dt-bindings: interrupt-controller: document BCM6345 external interrupt
    controller
  irqchip: add support for BCM6345 external interrupt controller

 .../brcm,bcm6345-ext-intc.yaml                |  78 +++++
 drivers/irqchip/Kconfig                       |   4 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-bcm6345-ext.c             | 271 ++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm6345-ext-intc.yaml
 create mode 100644 drivers/irqchip/irq-bcm6345-ext.c

-- 
2.20.1

