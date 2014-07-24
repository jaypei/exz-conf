;;; exz-jabber.el --- summary

;; Copyright (C) 2014 jaypei

;; Author: jaypei <jaypei97159@gmail.com>
;; Version: 0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(setq jabber-invalid-certificate-servers '("l-im1.vy.corp.qunar.com"))

(setq jabber-account-list
      '(("jaypei@l-im1.vy.corp.qunar.com"
         (:network-server . "l-im1.s.corp.qunar.com")
         (:port . "5222")
         (:connection-type . starttls))))

(setq jabber-muc-autojoin '("qunar群聊@conference.l-im1.vy.corp.qunar.com" "dujia-mobile@conference.l-im1.vy.corp.qunar.com"))
(setq jabber-invalid-certificate-servers '("l-im1.vy.corp.qunar.com"))
(setq starttls-extra-arguments  '("--insecure"))

(provide 'exz-jabber)
;;; exz-jabber.el ends here
