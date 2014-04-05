Received: from forward19.mail.yandex.net ([95.108.253.144]:39543 "EHLO
        forward19.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816786AbaDEMsMVScnD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 5 Apr 2014 14:48:12 +0200
Received: from web14j.yandex.ru (web14j.yandex.ru [5.45.198.55])
        by forward19.mail.yandex.net (Yandex) with ESMTP id 1995C11203B4
        for <linux-mips@linux-mips.org>; Sat,  5 Apr 2014 16:47:45 +0400 (MSK)
From: kr kr <kr-jiffy@yandex.ru>
Subject: [MIPS Malta 5kc] Re-flashing using BDI 2000 problem.
MIME-Version: 1.0
Message-ID: <6183191396702064@web14j.yandex.ru>
Date: Sat, 05 Apr 2014 16:47:44 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Return-Path: <kr-jiffy@yandex.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20140405124744.iGVLjZDkW4y6JeOKaGvKPza7XYPAeyufoVIphl-xags@z>

Hello,

I've been trying to re-flash mips malta 5kc board (the real board,  not quemu) with a yamon image, using Abatron bdi 2000. No success yet.
JP1 jumper (MFWR) on the board is closed, S5 switch is set to: 1 - "open", 2 - "closed" (BE mode),  3 - "open", 4 - "open". On board display shows "Power on".
