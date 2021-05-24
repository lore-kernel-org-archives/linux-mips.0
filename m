Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D37C47080
	for <linux-mips@archiver.kernel.org>; Mon, 24 May 2021 06:08:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69D6F61139
	for <linux-mips@archiver.kernel.org>; Mon, 24 May 2021 06:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbhEXGJj (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 24 May 2021 02:09:39 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:39704 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbhEXGJg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 May 2021 02:09:36 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 97F5CACD28;
        Mon, 24 May 2021 14:07:56 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P32531T140357266978560S1621836476906347_;
        Mon, 24 May 2021 14:07:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f34be6d2344b318aee428dfa28c3425c>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: robh+dt@kernel.org
X-RCPT-COUNT: 9
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de
Cc:     maoxiaochuan@loongson.cn, jiaxun.yang@flygoat.com,
        zhangqing@loongson.cn, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH 0/5] mips: dts: loongson: fix DTC unit name warnings 
Date:   Mon, 24 May 2021 14:07:33 +0800
Message-ID: <cover.1621586643.git.zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
Message-ID: <20210524060733.AkGhAjro2ZGdRWgjFhvN-r7kqNrbaftSc0BLDAjaSJQ@z>

*** BLURB HERE ***

zhaoxiao (5):
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings
  mips: dts: loongson: fix DTC unit name warnings

 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi       | 2 +-
 arch/mips/boot/dts/loongson/loongson64g-package.dtsi     | 4 ++--
 arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi                | 2 +-
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.20.1



