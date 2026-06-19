# Thống kê các chuỗi văn bản cứng (Hardcoded Text) - Checkpoint Web

Tài liệu này chứa danh sách các chuỗi văn bản Tiếng Việt đang được viết cứng trong mã nguồn frontend của Checkpoint. Đây là bước chuẩn bị để tiến hành quốc tế hóa (i18n) cho ứng dụng.

## 📊 Thống kê sơ bộ
- **Tổng số tệp chứa chuỗi cứng**: 58
- **Tổng số chuỗi cần dịch**: 488

## 🔍 Danh sách chi tiết theo từng tệp

### 📁 [AuthContext.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/auth/AuthContext.tsx)
*Đường dẫn đầy đủ: `src/auth/AuthContext.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 132 | Kiểm tra email để xác nhận tài khoản, rồi đăng nhập. | `throw new Error("Kiểm tra email để xác nhận tài khoản, rồi đăng nhập.");` | `kiem_tra_email_de_xac` |
| 162 | Không tạo được phiên khách | `if (!data.session) throw new Error("Không tạo được phiên khách");` | `khong_tao_duoc_phien_khach` |

### 📁 [AppLayout.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/AppLayout.tsx)
*Đường dẫn đầy đủ: `src/components/AppLayout.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 33 | Thông báo | `aria-label="Thông báo"` | `thong_bao` |

### 📁 [AvatarCropSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/AvatarCropSheet.tsx)
*Đường dẫn đầy đủ: `src/components/AvatarCropSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 176 | Cắt ảnh đại diện | `<Sheet title="Cắt ảnh đại diện" onClose={onClose}>` | `cat_anh_dai_dien` |
| 241 | Đang xử lý... | `{processing ? "Đang xử lý..." : "Xong"}` | `dang_xu_ly` |

### 📁 [AvatarFramePicker.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/AvatarFramePicker.tsx)
*Đường dẫn đầy đủ: `src/components/AvatarFramePicker.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 82 | Không khung | `<span className="w-16 truncate text-center text-[10px] text-muted-foreground"...` | `khong_khung` |
| 95 | ${frame.label} — chưa mở khóa | `title={unlocked ? frame.label : `${frame.label} — chưa mở khóa`}` | `framelabel_chua_mo_khoa` |

### 📁 [BadgeMedal.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/BadgeMedal.tsx)
*Đường dẫn đầy đủ: `src/components/BadgeMedal.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 96 | Cấp showLevel | `Cấp {showLevel}` | `cap_showlevel` |

### 📁 [BadgeUnlockModal.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/BadgeUnlockModal.tsx)
*Đường dẫn đầy đủ: `src/components/BadgeUnlockModal.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 92 | Huy hiệu mớibadges.length > 1 ? ` · $idx + 1/$badges.length` : "" | `Huy hiệu mới{badges.length > 1 ? ` · ${idx + 1}/${badges.length}` : ""}` | `huy_hieu_moibadgeslength_1_idx` |
| 110 | Cấp badge.level | `Cấp {badge.level}` | `cap_badgelevel` |
| 135 | Tiếp theo → | `{idx < badges.length - 1 ? "Tiếp theo →" : "Tuyệt vời!"}` | `tiep_theo` |
| 135 | Tuyệt vời! | `{idx < badges.length - 1 ? "Tiếp theo →" : "Tuyệt vời!"}` | `tuyet_voi` |

### 📁 [BadgeUnlockToast.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/BadgeUnlockToast.tsx)
*Đường dẫn đầy đủ: `src/components/BadgeUnlockToast.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 18 | Mở khóa huy hiệu | `<Icon name="party" size={14} /> Mở khóa huy hiệu` | `mo_khoa_huy_hieu` |

### 📁 [BadgesSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/BadgesSection.tsx)
*Đường dẫn đầy đủ: `src/components/BadgesSection.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 27 | Huy hiệu | `<Icon name="award" size={20} className="text-gold" /> Huy hiệu` | `huy_hieu` |
| 41 | Xem tất cả | `Xem tất cả` | `xem_tat_ca` |

### 📁 [CameraCaptureSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/CameraCaptureSheet.tsx)
*Đường dẫn đầy đủ: `src/components/CameraCaptureSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 176 | trước | `? currentDevice.info.label \|\| `Camera ${facing === "user" ? "trước" : "sau"...` | `truoc` |
| 429 | Đóng | `aria-label="Đóng"` | `dong` |
| 456 | Xem trước | `<img src={previewUrl} alt="Xem trước" className="h-full w-full object-cover" />` | `xem_truoc` |
| 465 | Không mở được camera. Hãy chọn ảnh từ thư viện. | `Không mở được camera. Hãy chọn ảnh từ thư viện.` | `khong_mo_duoc_camera_hay` |
| 472 | Chọn từ thư viện | `Chọn từ thư viện` | `chon_tu_thu_vien` |
| 517 | Chọn camera ${index + 1} | `aria-label={`Chọn camera ${index + 1}`}` | `chon_camera_index_1` |
| 540 | Chụp lại | `Chụp lại` | `chup_lai` |
| 548 | Tiếp tục | `Tiếp tục` | `tiep_tuc` |
| 575 | Thư viện | `Thư viện` | `thu_vien` |
| 588 | Chụp ảnh | `aria-label="Chụp ảnh"` | `chup_anh` |
| 597 | Lật camera trước sau | `aria-label="Lật camera trước sau"` | `lat_camera_truoc_sau` |

### 📁 [CheckpointDetailSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/CheckpointDetailSheet.tsx)
*Đường dẫn đầy đủ: `src/components/CheckpointDetailSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 62 | Đang xử lý... | `<span className="text-xs">Đang xử lý...</span>` | `dang_xu_ly` |
| 130 | Chụp lúc new Date(data.checkpoint.taken_at).toLocaleString("vi-VN") | `<p>Chụp lúc {new Date(data.checkpoint.taken_at).toLocaleString("vi-VN")}</p>` | `chup_luc_new_datedatacheckpointtaken_attolocalestringvivn` |
| 137 | Mình vừa check-in tại ${data.checkpoint.name} trên Checkpoint! | `text={`Mình vừa check-in tại ${data.checkpoint.name} trên Checkpoint!`}` | `minh_vua_checkin_tai_datacheckpointname` |
| 179 | Xoá check-in | `<Icon name="trash" size={16} /> Xoá check-in` | `xoa_checkin` |

### 📁 [CommentSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/CommentSection.tsx)
*Đường dẫn đầy đủ: `src/components/CommentSection.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 102 | Bình luận (count) | `<h3 className="font-display text-base font-bold">Bình luận ({count})</h3>` | `binh_luan_count` |
| 110 | Viết bình luận... | `placeholder="Viết bình luận..."` | `viet_binh_luan` |
| 117 | Gửi | `aria-label="Gửi"` | `gui` |
| 134 | Chưa có bình luận nào. | `<p className="py-2 text-sm text-muted-foreground">Chưa có bình luận nào.</p>` | `chua_co_binh_luan_nao` |
| 148 | Đang tải... | `<p className="py-1 text-center text-xs text-muted-foreground">Đang tải...</p>` | `dang_tai` |
| 173 | Mở hồ sơ ${comment.display_name || comment.username} | `aria-label={`Mở hồ sơ ${comment.display_name \|\| comment.username}`}` | `mo_ho_so_commentdisplay_name` |
| 203 | Xoá bình luận | `aria-label="Xoá bình luận"` | `xoa_binh_luan` |

### 📁 [CreateCheckpointForm.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/CreateCheckpointForm.tsx)
*Đường dẫn đầy đủ: `src/components/CreateCheckpointForm.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 288 | Tối đa 1 video/check-in. | `setErr("Tối đa 1 video/check-in.");` | `toi_da_1_videocheckin` |
| 304 | Tối đa ${maxImages} ảnh/check-in. | `setErr(`Tối đa ${maxImages} ảnh/check-in.`);` | `toi_da_maximages_anhcheckin` |
| 325 | Không xử lý được media. Vui lòng thử file khác. | `setErr(e instanceof Error ? e.message : "Không xử lý được media. Vui lòng thử...` | `khong_xu_ly_duoc_media` |
| 352 | Bắt buộc phải có ít nhất 1 ảnh hoặc video. | `setErr("Bắt buộc phải có ít nhất 1 ảnh hoặc video.");` | `bat_buoc_phai_co_it` |
| 366 | Không lấy được link upload. Vui lòng thử lại. | `setErr("Không lấy được link upload. Vui lòng thử lại.");` | `khong_lay_duoc_link_upload` |
| 382 | Upload ảnh/video thất bại. Vui lòng thử lại. | `setErr("Upload ảnh/video thất bại. Vui lòng thử lại.");` | `upload_anhvideo_that_bai_vui` |
| 421 | Bạn đang check-in tại đâu? | `<h3 className="text-base font-bold text-foreground">Bạn đang check-in tại đâu...` | `ban_dang_checkin_tai_dau` |
| 422 | Chọn một địa điểm gần bạn để check-in: | `<p className="text-xs text-muted-foreground">Chọn một địa điểm gần bạn để che...` | `chon_mot_dia_diem_gan` |
| 460 | cách Math.round(p.distance)m | `cách {Math.round(p.distance)}m` | `cach_mathroundpdistancem` |
| 476 | Tạo địa điểm mới | `<Icon name="plus" size={16} /> Tạo địa điểm mới` | `tao_dia_diem_moi` |
| 492 | Check-in tại địa điểm | `<p className="text-xs text-muted-foreground font-medium">Check-in tại địa điể...` | `checkin_tai_dia_diem` |
| 502 | Thay đổi | `Thay đổi` | `thay_doi` |
| 515 | Đang tạo địa điểm mới | `<p className="text-xs text-muted-foreground font-medium">Đang tạo địa điểm mớ...` | `dang_tao_dia_diem_moi` |
| 517 | Chưa nhập tên địa điểm | `{name \|\| "Chưa nhập tên địa điểm"}` | `chua_nhap_ten_dia_diem` |
| 526 | Xem danh sách | `Xem danh sách` | `xem_danh_sach` |
| 534 | Ghi vào hành trình | `<Icon name="luggage" size={16} /> Ghi vào hành trình` | `ghi_vao_hanh_trinh` |
| 541 | Không gắn hành trình | `<option value="">Không gắn hành trình</option>` | `khong_gan_hanh_trinh` |
| 555 | Chụp lúc formatTakenAt(initialTakenAt) | `Chụp lúc <span className="font-semibold text-foreground">{formatTakenAt(initi...` | `chup_luc_formattakenatinitialtakenat` |
| 562 | Địa điểm | `<Icon name="pin" size={20} className="text-primary" /> Địa điểm` | `dia_diem` |
| 571 | Tên địa điểm | `placeholder="Tên địa điểm"` | `ten_dia_diem` |
| 598 | Đánh giá địa điểm | `<Icon name="star" size={20} className="fill-gold text-gold" /> Đánh giá địa điểm` | `danh_gia_dia_diem` |
| 618 | Thêm ảnh | `<Icon name="camera" size={20} className="text-primary" /> Thêm ảnh` | `them_anh` |
| 620 | imageCount/maxImages ảnh | `<span className="text-xs font-semibold text-primary">{imageCount}/{maxImages}...` | `imagecountmaximages_anh` |
| 641 | Xóa video | `aria-label={p.type === "video" ? "Xóa video" : "Xóa ảnh"}` | `xoa_video` |
| 641 | Xóa ảnh | `aria-label={p.type === "video" ? "Xóa video" : "Xóa ảnh"}` | `xoa_anh` |
| 658 | Đang xử lý… | `<span className="text-xs">Đang xử lý…</span>` | `dang_xu_ly` |

### 📁 [CreateCheckpointSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/CreateCheckpointSheet.tsx)
*Đường dẫn đầy đủ: `src/components/CreateCheckpointSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 13 | Cắm cờ tại đây | `<Sheet title="Cắm cờ tại đây" onClose={onClose}>` | `cam_co_tai_day` |

### 📁 [DriveConnectCard.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/DriveConnectCard.tsx)
*Đường dẫn đầy đủ: `src/components/DriveConnectCard.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 58 | Đang ngắt... | `{disconnectMutation.isPending ? "Đang ngắt..." : "Ngắt kết nối"}` | `dang_ngat` |
| 58 | Ngắt kết nối | `{disconnectMutation.isPending ? "Đang ngắt..." : "Ngắt kết nối"}` | `ngat_ket_noi` |
| 71 | Chưa kết nối | `<p className="text-xs text-muted-foreground">Chưa kết nối</p>` | `chua_ket_noi` |
| 78 | Đang mở... | `{connectMutation.isPending ? "Đang mở..." : "Kết nối"}` | `dang_mo` |
| 78 | Kết nối | `{connectMutation.isPending ? "Đang mở..." : "Kết nối"}` | `ket_noi` |

### 📁 [EditProfileSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/EditProfileSheet.tsx)
*Đường dẫn đầy đủ: `src/components/EditProfileSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 82 | Tải ảnh thất bại. | `setError(err instanceof Error ? err.message : "Tải ảnh thất bại.");` | `tai_anh_that_bai` |
| 105 | Lưu thất bại. | `setError(err instanceof Error ? err.message : "Lưu thất bại.");` | `luu_that_bai` |
| 113 | Sửa hồ sơ | `<Sheet title="Sửa hồ sơ" onClose={onClose}>` | `sua_ho_so` |
| 122 | Đổi ảnh đại diện | `aria-label="Đổi ảnh đại diện"` | `doi_anh_dai_dien` |
| 137 | Đang tải ảnh... | `{uploading ? "Đang tải ảnh..." : "Chạm để đổi ảnh & khung avatar"}` | `dang_tai_anh` |
| 137 | Chạm để đổi ảnh & khung avatar | `{uploading ? "Đang tải ảnh..." : "Chạm để đổi ảnh & khung avatar"}` | `cham_de_doi_anh_khung` |
| 150 | Tên hiển thị | `<span className="text-sm font-semibold text-foreground">Tên hiển thị</span>` | `ten_hien_thi` |
| 162 | Giới thiệu | `<span className="text-sm font-semibold text-foreground">Giới thiệu</span>` | `gioi_thieu` |
| 167 | Đôi dòng về bạn... | `placeholder="Đôi dòng về bạn..."` | `doi_dong_ve_ban` |
| 176 | Đang lưu... | `{saving ? "Đang lưu..." : "Lưu"}` | `dang_luu` |
| 176 | Lưu | `{saving ? "Đang lưu..." : "Lưu"}` | `luu` |

### 📁 [ErrorBoundary.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/ErrorBoundary.tsx)
*Đường dẫn đầy đủ: `src/components/ErrorBoundary.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 42 | Có lỗi xảy ra | `<h1 className="font-display text-xl font-bold text-foreground">Có lỗi xảy ra<...` | `co_loi_xay_ra` |
| 44 | Ứng dụng gặp sự cố khi tải. Vui lòng thử lại. | `Ứng dụng gặp sự cố khi tải. Vui lòng thử lại.` | `ung_dung_gap_su_co` |
| 51 | Tải lại | `Tải lại` | `tai_lai` |

### 📁 [GooglePhotosConnectCard.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/GooglePhotosConnectCard.tsx)
*Đường dẫn đầy đủ: `src/components/GooglePhotosConnectCard.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 49 | Đã kết nối | `<p className="text-xs text-muted-foreground">Đã kết nối</p>` | `da_ket_noi` |
| 56 | Đang ngắt... | `{disconnectMutation.isPending ? "Đang ngắt..." : "Ngắt kết nối"}` | `dang_ngat` |
| 56 | Ngắt kết nối | `{disconnectMutation.isPending ? "Đang ngắt..." : "Ngắt kết nối"}` | `ngat_ket_noi` |
| 69 | Chưa kết nối | `<p className="text-xs text-muted-foreground">Chưa kết nối</p>` | `chua_ket_noi` |
| 76 | Đang mở... | `{connectMutation.isPending ? "Đang mở..." : "Kết nối"}` | `dang_mo` |
| 76 | Kết nối | `{connectMutation.isPending ? "Đang mở..." : "Kết nối"}` | `ket_noi` |

### 📁 [InstallHint.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/InstallHint.tsx)
*Đường dẫn đầy đủ: `src/components/InstallHint.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 44 | Chia sẻ | `Cài Checkpoint: bấm <span className="font-semibold">Chia sẻ</span> rồi{" "}` | `chia_se` |
| 45 | Thêm vào MH chính | `<span className="font-semibold">Thêm vào MH chính</span>` | `them_vao_mh_chinh` |
| 49 | Đóng | `aria-label="Đóng"` | `dong` |

### 📁 [JourneyDetailSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/JourneyDetailSheet.tsx)
*Đường dẫn đầy đủ: `src/components/JourneyDetailSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 130 | Chưa có check-in nào trong hành trình. | `<p className="p-3 text-sm text-muted-foreground">Chưa có check-in nào trong h...` | `chua_co_checkin_nao_trong` |
| 155 | Hành trình | `text={`Hành trình "${data.journey.title}" của mình trên Checkpoint!`}` | `hanh_trinh` |
| 155 | của mình trên Checkpoint! | `text={`Hành trình "${data.journey.title}" của mình trên Checkpoint!`}` | `cua_minh_tren_checkpoint` |
| 156 | Chia sẻ hành trình | `label="Chia sẻ hành trình"` | `chia_se_hanh_trinh` |
| 199 | Điểm duy nhất | `ariaLabel: "Điểm duy nhất",` | `diem_duy_nhat` |
| 207 | Điểm bắt đầu | `ariaLabel: "Điểm bắt đầu",` | `diem_bat_dau` |
| 215 | Điểm kết thúc | `ariaLabel: "Điểm kết thúc",` | `diem_ket_thuc` |
| 222 | Điểm số ${index + 1} | `ariaLabel: `Điểm số ${index + 1}`,` | `diem_so_index_1` |
| 387 | Mở ${stop.name} | `aria-label={`Mở ${stop.name}`}` | `mo_stopname` |

### 📁 [JourneysSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/JourneysSection.tsx)
*Đường dẫn đầy đủ: `src/components/JourneysSection.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 302 | Không lưu được hành trình. Vui lòng thử lại. | `error: "Không lưu được hành trình. Vui lòng thử lại.",` | `khong_luu_duoc_hanh_trinh` |
| 335 | Không xóa được hành trình. Vui lòng thử lại. | `error: "Không xóa được hành trình. Vui lòng thử lại.",` | `khong_xoa_duoc_hanh_trinh` |
| 343 | Hành trình | `<h3 className="font-display text-lg font-bold">Hành trình</h3>` | `hanh_trinh` |
| 352 | Tạo hành trình | `aria-label="Tạo hành trình"` | `tao_hanh_trinh` |
| 364 | Từ check-in | `<Icon name="plus-circle" size={16} className="text-primary" /> Từ check-in` | `tu_checkin` |
| 371 | Bắt đầu | `<Icon name="flag" size={16} className="text-primary" /> Bắt đầu` | `bat_dau` |
| 386 | Đang đi | `<p className="text-xs text-green-700">Đang đi</p>` | `dang_di` |
| 390 | Kết thúc | `Kết thúc` | `ket_thuc` |
| 424 | · đang đi | `{j.is_active && " · đang đi"}` | `dang_di` |
| 439 | Tùy chọn hành trình | `aria-label="Tùy chọn hành trình"` | `tuy_chon_hanh_trinh` |
| 451 | Sửa | `<Icon name="pencil" size={16} /> Sửa` | `sua` |
| 458 | Xóa | `<Icon name="trash" size={16} /> Xóa` | `xoa` |
| 492 | Tên hành trình | `placeholder="Tên hành trình"` | `ten_hanh_trinh` |
| 499 | Mô tả (tùy chọn) | `placeholder="Mô tả (tùy chọn)"` | `mo_ta_tuy_chon` |
| 507 | Thời gian hành trình: selectedDateSpan | `Thời gian hành trình: <span className="font-semibold text-foreground">{select...` | `thoi_gian_hanh_trinh_selecteddatespan` |
| 513 | Check-in đã chọn | `<p className="text-sm font-semibold text-foreground">Check-in đã chọn</p>` | `checkin_da_chon` |
| 515 | + Chọn thêm | `+ Chọn thêm` | `chon_them` |
| 546 | Đang tạo... | `{draft.busy ? "Đang tạo..." : "Tạo hành trình"}` | `dang_tao` |
| 553 | Bắt đầu hành trình | `<Sheet title="Bắt đầu hành trình" onClose={() => setStarting(false)}>` | `bat_dau_hanh_trinh` |
| 560 | Tên hành trình (vd: Đà Lạt 3 ngày) | `placeholder="Tên hành trình (vd: Đà Lạt 3 ngày)"` | `ten_hanh_trinh_vd_da` |
| 574 | Check-in sau khi bắt đầu sẽ tự gắn vào hành trình này. | `Check-in sau khi bắt đầu sẽ tự gắn vào hành trình này.` | `checkin_sau_khi_bat_dau` |
| 581 | Sửa hành trình | `<Sheet title="Sửa hành trình" onClose={() => setActions(emptyActions)}>` | `sua_hanh_trinh` |
| 600 | Đang lưu... | `{actions.busy ? "Đang lưu..." : "Lưu thay đổi"}` | `dang_luu` |
| 600 | Lưu thay đổi | `{actions.busy ? "Đang lưu..." : "Lưu thay đổi"}` | `luu_thay_doi` |
| 607 | Xóa hành trình | `<Sheet title="Xóa hành trình" onClose={() => setActions(emptyActions)}>` | `xoa_hanh_trinh` |
| 610 | Xóa "actions.deleting.title"? | `<p className="font-semibold">Xóa "{actions.deleting.title}"?</p>` | `xoa_actionsdeletingtitle` |
| 612 | Bạn có thể chỉ xóa hành trình và giữ các check-in, hoặc xóa cả checkpoints trong hành trình này. | `Bạn có thể chỉ xóa hành trình và giữ các check-in, hoặc xóa cả checkpoints tr...` | `ban_co_the_chi_xoa` |
| 622 | Đang xóa... | `{actions.busy ? "Đang xóa..." : "Chỉ xóa hành trình"}` | `dang_xoa` |
| 622 | Chỉ xóa hành trình | `{actions.busy ? "Đang xóa..." : "Chỉ xóa hành trình"}` | `chi_xoa_hanh_trinh` |
| 630 | Xóa cả checkpoints | `Xóa cả checkpoints` | `xoa_ca_checkpoints` |
| 633 | Xóa cả checkpoints sẽ xóa check-in, trừ lại XP/counters và đưa ảnh/video sang worker để dọn sau. | `Xóa cả checkpoints sẽ xóa check-in, trừ lại XP/counters và đưa ảnh/video sang...` | `xoa_ca_checkpoints_se_xoa` |
| 636 | Hủy | `Hủy` | `huy` |
| 688 | Chọn check-in | `<h2 className="font-display text-lg font-bold">Chọn check-in</h2>` | `chon_checkin` |
| 692 | Đóng | `aria-label="Đóng"` | `dong` |
| 715 | Bỏ chọn tất cả | `{allSelected ? "Bỏ chọn tất cả" : "Chọn tất cả"}` | `bo_chon_tat_ca` |
| 715 | Chọn tất cả | `{allSelected ? "Bỏ chọn tất cả" : "Chọn tất cả"}` | `chon_tat_ca` |
| 729 | Không có check-in nào chưa thuộc hành trình. | `Không có check-in nào chưa thuộc hành trình.` | `khong_co_checkin_nao_chua` |
| 755 | Đang tải thêm... | `<p className="py-2 text-center text-xs text-muted-foreground">Đang tải thêm.....` | `dang_tai_them` |
| 758 | Đã hết danh sách. | `<p className="py-2 text-center text-xs text-muted-foreground">Đã hết danh sác...` | `da_het_danh_sach` |
| 765 | Đã chọn selectedCount | `<span className="text-sm font-semibold text-muted-foreground">Đã chọn {select...` | `da_chon_selectedcount` |
| 768 | Huỷ | `Huỷ` | `huy` |
| 771 | Tiếp tục | `Tiếp tục` | `tiep_tuc` |
| 816 | Bỏ ${checkpoint.name} | `aria-label={`Bỏ ${checkpoint.name}`}` | `bo_checkpointname` |

### 📁 [LocationPermissionContent.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/LocationPermissionContent.tsx)
*Đường dẫn đầy đủ: `src/components/LocationPermissionContent.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 17 | Nhấn giữ biểu tượng app Checkpoint ở màn hình chính | `"Nhấn giữ biểu tượng app Checkpoint ở màn hình chính",` | `nhan_giu_bieu_tuong_app` |
| 18 | Chọn “Thông tin ứng dụng” (ⓘ) | `"Chọn “Thông tin ứng dụng” (ⓘ)",` | `chon_thong_tin_ung_dung` |
| 19 | Quyền → Vị trí → Cho phép | `"Quyền → Vị trí → Cho phép",` | `quyen_vi_tri_cho_phep` |
| 20 | Mở lại app rồi thử check-in | `"Mở lại app rồi thử check-in",` | `mo_lai_app_roi_thu` |
| 23 | Nhấn biểu tượng 🔒 / ⓘ bên trái thanh địa chỉ | `"Nhấn biểu tượng 🔒 / ⓘ bên trái thanh địa chỉ",` | `nhan_bieu_tuong_ben_trai` |
| 24 | Quyền (Permissions) → Vị trí (Location) → Cho phép | `"Quyền (Permissions) → Vị trí (Location) → Cho phép",` | `quyen_permissions_vi_tri_location` |
| 25 | Tải lại trang | `"Tải lại trang",` | `tai_lai_trang` |
| 31 | Mở Cài đặt iPhone | `"Mở Cài đặt iPhone",` | `mo_cai_dat_iphone` |
| 32 | Vuốt xuống tìm “Checkpoint” (hoặc Safari) | `"Vuốt xuống tìm “Checkpoint” (hoặc Safari)",` | `vuot_xuong_tim_checkpoint_hoac` |
| 33 | Vị trí → chọn “Khi dùng ứng dụng” | `"Vị trí → chọn “Khi dùng ứng dụng”",` | `vi_tri_chon_khi_dung` |
| 34 | Mở lại app | `"Mở lại app",` | `mo_lai_app` |
| 37 | Bấm “あ/AA” cạnh thanh địa chỉ → Cài đặt trang web | `"Bấm “あ/AA” cạnh thanh địa chỉ → Cài đặt trang web",` | `bam_aa_canh_thanh_dia` |
| 38 | Vị trí → Cho phép (hoặc Cài đặt → Safari → Vị trí) | `"Vị trí → Cho phép (hoặc Cài đặt → Safari → Vị trí)",` | `vi_tri_cho_phep_hoac` |
| 44 | Bấm biểu tượng ⚙ / 🔒 trên thanh tiêu đề cửa sổ app | `"Bấm biểu tượng ⚙ / 🔒 trên thanh tiêu đề cửa sổ app",` | `bam_bieu_tuong_tren_thanh` |
| 45 | Site settings → Vị trí (Location) → Cho phép | `"Site settings → Vị trí (Location) → Cho phép",` | `site_settings_vi_tri_location` |
| 46 | Tải lại | `"Tải lại",` | `tai_lai` |
| 49 | Bấm biểu tượng 🔒 bên trái địa chỉ web | `"Bấm biểu tượng 🔒 bên trái địa chỉ web",` | `bam_bieu_tuong_ben_trai` |
| 50 | Vị trí (Location) → Cho phép (Allow) | `"Vị trí (Location) → Cho phép (Allow)",` | `vi_tri_location_cho_phep` |
| 84 | Định vị cần kết nối an toàn (HTTPS). Hãy mở app qua đường dẫn https://… | `setError("Định vị cần kết nối an toàn (HTTPS). Hãy mở app qua đường dẫn https...` | `dinh_vi_can_ket_noi` |
| 92 | Không lấy được vị trí. Vui lòng thử lại. | `setError("Không lấy được vị trí. Vui lòng thử lại.");` | `khong_lay_duoc_vi_tri` |
| 131 | Vị trí đang bị chặn | `{denied ? "Vị trí đang bị chặn" : "Cho phép định vị"}` | `vi_tri_dang_bi_chan` |
| 131 | Cho phép định vị | `{denied ? "Vị trí đang bị chặn" : "Cho phép định vị"}` | `cho_phep_dinh_vi` |
| 136 | Bạn đã chặn quyền vị trí. Bật lại theo các bước: | `<p className="text-sm text-muted-foreground">Bạn đã chặn quyền vị trí. Bật lạ...` | `ban_da_chan_quyen_vi` |
| 143 | Đang kiểm tra... | `{busy ? "Đang kiểm tra..." : "Tôi đã bật, thử lại"}` | `dang_kiem_tra` |
| 143 | Tôi đã bật, thử lại | `{busy ? "Đang kiểm tra..." : "Tôi đã bật, thử lại"}` | `toi_da_bat_thu_lai` |
| 149 | Checkpoint cần vị trí của bạn để cắm cờ đúng nơi bạn đang đứng. Vị trí chỉ dùng cho lần | `Checkpoint cần vị trí của bạn để cắm cờ đúng nơi bạn đang đứng. Vị trí chỉ dù...` | `checkpoint_can_vi_tri_cua` |
| 150 | check-in này. | `check-in này.` | `checkin_nay` |
| 154 | Trình duyệt chỉ cho phép định vị qua HTTPS. Hãy mở app bằng đường dẫn https://… | `Trình duyệt chỉ cho phép định vị qua HTTPS. Hãy mở app bằng đường dẫn https://…` | `trinh_duyet_chi_cho_phep` |
| 164 | Đang lấy vị trí... | `{busy ? "Đang lấy vị trí..." : "Cho phép định vị"}` | `dang_lay_vi_tri` |
| 171 | Để sau | `Để sau` | `de_sau` |

### 📁 [MapSkeleton.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/MapSkeleton.tsx)
*Đường dẫn đầy đủ: `src/components/MapSkeleton.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 22 | Đang tải bản đồ… | `<span className="text-sm font-medium text-muted-foreground">Đang tải bản đồ…<...` | `dang_tai_ban_do` |

### 📁 [MediaPreview.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/MediaPreview.tsx)
*Đường dẫn đầy đủ: `src/components/MediaPreview.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 68 | Xoay trái | `aria-label="Xoay trái"` | `xoay_trai` |
| 76 | Xoay phải | `aria-label="Xoay phải"` | `xoay_phai` |
| 111 | Phát video ${alt} | `aria-label={isVideo ? (alt ? `Phát video ${alt}` : "Phát video") : (alt ? `Xe...` | `phat_video_alt` |
| 111 | Phát video | `aria-label={isVideo ? (alt ? `Phát video ${alt}` : "Phát video") : (alt ? `Xe...` | `phat_video` |
| 111 | Xem ảnh ${alt} | `aria-label={isVideo ? (alt ? `Phát video ${alt}` : "Phát video") : (alt ? `Xe...` | `xem_anh_alt` |
| 111 | Xem ảnh | `aria-label={isVideo ? (alt ? `Phát video ${alt}` : "Phát video") : (alt ? `Xe...` | `xem_anh` |

### 📁 [MyCheckpointsSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/MyCheckpointsSheet.tsx)
*Đường dẫn đầy đủ: `src/components/MyCheckpointsSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 86 | Điểm đánh giá phải từ 1 đến 5. | `current ? { ...current, error: "Điểm đánh giá phải từ 1 đến 5." } : current,` | `diem_danh_gia_phai_tu` |
| 110 | Không lưu được check-in. Vui lòng thử lại. | `current ? { ...current, busy: false, error: "Không lưu được check-in. Vui lòn...` | `khong_luu_duoc_checkin_vui` |
| 117 | Check-in của tôi | `<Sheet title="Check-in của tôi" onClose={onClose} grow className="h-[90dvh]">` | `checkin_cua_toi` |
| 127 | Chưa có check-in nào. | `Chưa có check-in nào.` | `chua_co_checkin_nao` |
| 174 | Sửa check-in | `<Sheet title="Sửa check-in" onClose={() => setEditing(null)}>` | `sua_checkin` |
| 183 | Tên địa điểm | `placeholder="Tên địa điểm"` | `ten_dia_diem` |
| 192 | Ghi chú (tùy chọn) | `placeholder="Ghi chú (tùy chọn)"` | `ghi_chu_tuy_chon` |
| 225 | Đang lưu... | `{editing.busy ? "Đang lưu..." : "Lưu thay đổi"}` | `dang_luu` |
| 225 | Lưu thay đổi | `{editing.busy ? "Đang lưu..." : "Lưu thay đổi"}` | `luu_thay_doi` |
| 331 | Tùy chọn check-in | `aria-label="Tùy chọn check-in"` | `tuy_chon_checkin` |
| 350 | Sửa | `<Icon name="pencil" size={16} /> Sửa` | `sua` |
| 360 | Xóa | `<Icon name="trash" size={16} /> Xóa` | `xoa` |

### 📁 [NotificationSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/NotificationSheet.tsx)
*Đường dẫn đầy đủ: `src/components/NotificationSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 23 | vừa xong | `if (s < 60) return "vừa xong";` | `vua_xong` |
| 24 | ${Math.floor(s / 60)} phút | `if (s < 3600) return `${Math.floor(s / 60)} phút`;` | `mathfloors_60_phut` |
| 25 | ${Math.floor(s / 3600)} giờ | `if (s < 86400) return `${Math.floor(s / 3600)} giờ`;` | `mathfloors_3600_gio` |
| 26 | ${Math.floor(s / 86400)} ngày | `if (s < 604800) return `${Math.floor(s / 86400)} ngày`;` | `mathfloors_86400_ngay` |
| 63 | Thông báo | `<h2 className="font-display text-lg font-bold">Thông báo</h2>` | `thong_bao` |
| 66 | Đóng | `aria-label="Đóng"` | `dong` |
| 77 | Chưa có thông báo nào. | `<p className="text-sm">Chưa có thông báo nào.</p>` | `chua_co_thong_bao_nao` |
| 160 | return <>who đã bình luận về cp</>; | `return <>{who} đã bình luận về {cp}</>;` | `return_who_da_binh_luan` |
| 162 | return <>who đã bày tỏ cảm xúc về cp</>; | `return <>{who} đã bày tỏ cảm xúc về {cp}</>;` | `return_who_da_bay_to` |
| 164 | return <>who đã theo dõi bạn</>; | `return <>{who} đã theo dõi bạn</>;` | `return_who_da_theo_doi` |
| 166 | return <>who đã bỏ theo dõi bạn</>; | `return <>{who} đã bỏ theo dõi bạn</>;` | `return_who_da_bo_theo` |
| 168 | return <>who vừa đăng check-in mới: cp</>; | `return <>{who} vừa đăng check-in mới: {cp}</>;` | `return_who_vua_dang_checkin` |

### 📁 [PassportSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/PassportSection.tsx)
*Đường dẫn đầy đủ: `src/components/PassportSection.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 51 | .replace(/^(Thành phố|Tỉnh)\s+/i, "") | `.replace(/^(Thành phố\|Tỉnh)\s+/i, "")` | `replacethanh_photinhsi` |
| 242 | ${stamp.name} - Đã ghé thăm ngày ${stamp.date} | `title={unlocked ? `${stamp.name} - Đã ghé thăm ngày ${stamp.date}` : `Cắm cờ ...` | `stampname_da_ghe_tham_ngay` |
| 242 | Cắm cờ ở khu vực mới để mở khóa con dấu tiếp theo | `title={unlocked ? `${stamp.name} - Đã ghé thăm ngày ${stamp.date}` : `Cắm cờ ...` | `cam_co_o_khu_vuc` |
| 304 | name: name.replace(/^(Thành phố|Tỉnh)\s+/i, "").trim(), | `name: name.replace(/^(Thành phố\|Tỉnh)\s+/i, "").trim(),` | `name_namereplacethanh_photinhsi_trim` |
| 344 | const cleanName = selectedStampForPhotos.name.replace(/^(Thành phố|Tỉnh)\s+/i, "").trim().toLowerCase(); | `const cleanName = selectedStampForPhotos.name.replace(/^(Thành phố\|Tỉnh)\s+/...` | `const_cleanname_selectedstampforphotosnamereplacethanh_photinhsi_trimtolowercase` |
| 369 | Địa điểm mới | `name: "Địa điểm mới",` | `dia_diem_moi` |
| 386 | Hộ chiếu | `Hộ chiếu` | `ho_chieu` |
| 411 | Người dùng này chưa có con dấu nào. | `{username ? "Người dùng này chưa có con dấu nào." : "Bạn chưa mở khóa địa điể...` | `nguoi_dung_nay_chua_co` |
| 411 | Bạn chưa mở khóa địa điểm nào | `{username ? "Người dùng này chưa có con dấu nào." : "Bạn chưa mở khóa địa điể...` | `ban_chua_mo_khoa_dia` |
| 414 | Hãy cắm cờ ở khu vực mới để nhận stamp đầu tiên! | `{username ? "" : "Hãy cắm cờ ở khu vực mới để nhận stamp đầu tiên!"}` | `hay_cam_co_o_khu` |
| 448 | Tất cả | `Tất cả` | `tat_ca` |
| 456 | Bộ sưu tập Hộ chiếu | `<Sheet title="Bộ sưu tập Hộ chiếu" onClose={() => setIsSheetOpen(false)}>` | `bo_suu_tap_ho_chieu` |
| 471 | Khoảnh khắc tại ${selectedStampForPhotos.name} | `title={`Khoảnh khắc tại ${selectedStampForPhotos.name}`}` | `khoanh_khac_tai_selectedstampforphotosname` |
| 481 | Không tìm thấy ảnh chụp tại tỉnh này. | `Không tìm thấy ảnh chụp tại tỉnh này.` | `khong_tim_thay_anh_chup` |

### 📁 [PlaceDetailSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/PlaceDetailSheet.tsx)
*Đường dẫn đầy đủ: `src/components/PlaceDetailSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 120 | ${placeInfo.name} trên Checkpoint | `text: `${placeInfo.name} trên Checkpoint`,` | `placeinfoname_tren_checkpoint` |
| 153 | Cắm cờ: placeInfo?.name | `<h2 className="mb-3 font-display text-lg font-bold">Cắm cờ: {placeInfo?.name}...` | `cam_co_placeinfoname` |
| 199 | placeInfo?.checkin_count lượt cắm cờ | `<Icon name="flag" size={14} /> {placeInfo?.checkin_count} lượt cắm cờ` | `placeinfocheckin_count_luot_cam_co` |
| 202 | placeInfo?.image_count ?? galleryItems.length ảnh | `<Icon name="image" size={14} /> {placeInfo?.image_count ?? galleryItems.lengt...` | `placeinfoimage_count_galleryitemslength_anh` |
| 213 | Bạn đã cắm cờ tại đây | `<Icon name="check" size={16} /> Bạn đã cắm cờ tại đây` | `ban_da_cam_co_tai` |
| 241 | Cắm cờ tại đây | `{user ? "Cắm cờ tại đây" : "Đăng nhập để cắm cờ"}` | `cam_co_tai_day` |
| 241 | Đăng nhập để cắm cờ | `{user ? "Cắm cờ tại đây" : "Đăng nhập để cắm cờ"}` | `dang_nhap_de_cam_co` |
| 251 | Chỉ đường | `Chỉ đường` | `chi_duong` |
| 257 | Tính năng lưu địa điểm sẽ được thêm sau | `title="Tính năng lưu địa điểm sẽ được thêm sau"` | `tinh_nang_luu_dia_diem` |
| 260 | Lưu | `Lưu` | `luu` |
| 268 | Chia sẻ | `Chia sẻ` | `chia_se` |
| 276 | Bật vị trí để Checkpoint cho biết bạn có đang đủ gần để cắm cờ không. | `? "Bật vị trí để Checkpoint cho biết bạn có đang đủ gần để cắm cờ không."` | `bat_vi_tri_de_checkpoint` |
| 278 | Bạn đang ở gần địa điểm này. Có thể cắm cờ ngay. | `? "Bạn đang ở gần địa điểm này. Có thể cắm cờ ngay."` | `ban_dang_o_gan_dia` |
| 279 | Bạn cách địa điểm này ${distanceStr}. Di chuyển gần hơn để cắm cờ chính xác hơn. | `: `Bạn cách địa điểm này ${distanceStr}. Di chuyển gần hơn để cắm cờ chính xá...` | `ban_cach_dia_diem_nay` |
| 286 | Check-in gần đây | `<Icon name="sparkle" size={22} className="text-gold" /> Check-in gần đây` | `checkin_gan_day` |
| 374 | Cuộn để xem thêm check-in | `<span className="text-xs text-muted-foreground">Cuộn để xem thêm check-in</span>` | `cuon_de_xem_them_checkin` |

### 📁 [PublicShareLayout.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/PublicShareLayout.tsx)
*Đường dẫn đầy đủ: `src/components/PublicShareLayout.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 27 | Đăng nhập | `Đăng nhập` | `dang_nhap` |

### 📁 [ReactionBar.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/ReactionBar.tsx)
*Đường dẫn đầy đủ: `src/components/ReactionBar.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 16 | Thích | `{ key: "like", icon: "like", label: "Thích", activeClass: "text-primary", fil...` | `thich` |
| 17 | Yêu thích | `{ key: "love", icon: "love", label: "Yêu thích", activeClass: "text-rose-500"...` | `yeu_thich` |
| 18 | Tuyệt vời | `{ key: "fire", icon: "fire", label: "Tuyệt vời", activeClass: "text-orange-50...` | `tuyet_voi` |
| 20 | Buồn | `{ key: "sad", icon: "sad", label: "Buồn", activeClass: "text-sky-500" },` | `buon` |
| 140 | Đăng nhập để sử dụng tính năng | `<Sheet title="Đăng nhập để sử dụng tính năng" onClose={() => setShowLoginProm...` | `dang_nhap_de_su_dung` |
| 143 | Đăng nhập để thả cảm xúc và sử dụng đầy đủ các tính năng của Checkpoint. | `Đăng nhập để thả cảm xúc và sử dụng đầy đủ các tính năng của Checkpoint.` | `dang_nhap_de_tha_cam` |
| 145 | Đăng nhập | `<Button onClick={() => navigate("/login")}>Đăng nhập</Button>` | `dang_nhap` |

### 📁 [SettingsSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/SettingsSheet.tsx)
*Đường dẫn đầy đủ: `src/components/SettingsSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 56 | Cài đặt | `<Sheet title={t("profile.settings", "Cài đặt")} onClose={onClose}>` | `cai_dat` |
| 61 | Check-in luôn khi mở app | `label={t("profile.openCreateOnLaunch", "Check-in luôn khi mở app")}` | `checkin_luon_khi_mo_app` |
| 62 | Đi thẳng đến màn hình cắm cờ mỗi khi tải lại hoặc mở app. | `description={t("profile.openCreateOnLaunchDesc", "Đi thẳng đến màn hình cắm c...` | `di_thang_den_man_hinh` |
| 71 | Ưu tiên chụp ảnh khi check-in | `label={t("profile.preferCameraOnCheckin", "Ưu tiên chụp ảnh khi check-in")}` | `uu_tien_chup_anh_khi` |
| 72 | Tự mở camera một lần khi bắt đầu check-in. | `description={t("profile.preferCameraOnCheckinDesc", "Tự mở camera một lần khi...` | `tu_mo_camera_mot_lan` |
| 82 | Ngôn ngữ | `<span className="block text-sm font-semibold text-foreground">{t("profile.lan...` | `ngon_ngu` |
| 83 | Thay đổi ngôn ngữ hiển thị của ứng dụng. | `<span className="mt-0.5 block text-xs text-muted-foreground">{t("profile.lang...` | `thay_doi_ngon_ngu_hien` |
| 90 | Tiếng Việt | `<option value="vi">{t("profile.vi", "Tiếng Việt")}</option>` | `tieng_viet` |
| 96 | Tích hợp dịch vụ | `<p className="mb-2 text-[11px] font-bold text-muted-foreground uppercase trac...` | `tich_hop_dich_vu` |

### 📁 [UpgradeBanner.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/UpgradeBanner.tsx)
*Đường dẫn đầy đủ: `src/components/UpgradeBanner.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 22 | Đã lưu. Nếu bật xác nhận email, kiểm tra hộp thư để hoàn tất. | `setMsg("Đã lưu. Nếu bật xác nhận email, kiểm tra hộp thư để hoàn tất.");` | `da_luu_neu_bat_xac` |
| 33 | tài khoản khách | `Bạn đang dùng <b>tài khoản khách</b> — dữ liệu có thể mất. Tạo tài khoản để l...` | `tai_khoan_khach` |
| 34 | (giữ nguyên data hiện có). | `(giữ nguyên data hiện có).` | `giu_nguyen_data_hien_co` |
| 38 | Tạo tài khoản → | `Tạo tài khoản →` | `tao_tai_khoan` |
| 56 | Mật khẩu | `placeholder="Mật khẩu"` | `mat_khau` |
| 60 | Đang lưu... | `{busy ? "Đang lưu..." : "Lưu tài khoản"}` | `dang_luu` |
| 60 | Lưu tài khoản | `{busy ? "Đang lưu..." : "Lưu tài khoản"}` | `luu_tai_khoan` |
| 69 | Hoặc liên kết Google | `Hoặc liên kết Google` | `hoac_lien_ket_google` |

### 📁 [UserProfileSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/UserProfileSheet.tsx)
*Đường dẫn đầy đủ: `src/components/UserProfileSheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 124 | Cấp u.level | `Cấp {u.level}` | `cap_ulevel` |
| 140 | u.checkin_streak ngày liên tiếp | `{u.checkin_streak} ngày liên tiếp` | `ucheckin_streak_ngay_lien_tiep` |
| 145 | Thành viên từ formatMemberSince(u.created_at) | `Thành viên từ {formatMemberSince(u.created_at)}` | `thanh_vien_tu_formatmembersinceucreated_at` |
| 157 | Cờ | `{ label: "Cờ", value: u.checkpoint_count.toString() },` | `co` |
| 158 | Hành trình | `{ label: "Hành trình", value: u.journey_count.toString() },` | `hanh_trinh` |
| 159 | Cấp | `{ label: "Cấp", value: u.level.toString() },` | `cap` |
| 183 | Đang theo dõi | `{isFollowing ? "Đang theo dõi" : "Theo dõi"}` | `dang_theo_doi` |
| 183 | Theo dõi | `{isFollowing ? "Đang theo dõi" : "Theo dõi"}` | `theo_doi` |
| 192 | Khoảnh khắc | `<h3 className="mb-2 font-display text-lg font-bold">Khoảnh khắc</h3>` | `khoanh_khac` |
| 197 | Chưa có check-in nào. | `Chưa có check-in nào.` | `chua_co_checkin_nao` |

### 📁 [ShareButton.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/share/ShareButton.tsx)
*Đường dẫn đầy đủ: `src/components/share/ShareButton.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 14 | Chia sẻ | `label = "Chia sẻ",` | `chia_se` |
| 44 | Đang tạo ảnh... | `{busy ? "Đang tạo ảnh..." : label}` | `dang_tao_anh` |

### 📁 [Sheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/ui/Sheet.tsx)
*Đường dẫn đầy đủ: `src/components/ui/Sheet.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 84 | Đóng | `aria-label="Đóng"` | `dong` |

### 📁 [Toast.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/components/ui/Toast.tsx)
*Đường dẫn đầy đủ: `src/components/ui/Toast.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 46 | Lên cấp ${level}! 🎉 | `{didLevelUp ? `Lên cấp ${level}! 🎉` : `Cấp ${level}`}` | `len_cap_level` |
| 46 | Cấp ${level} | `{didLevelUp ? `Lên cấp ${level}! 🎉` : `Cấp ${level}`}` | `cap_level` |

### 📁 [CheckinQueue.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/context/CheckinQueue.tsx)
*Đường dẫn đầy đủ: `src/context/CheckinQueue.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 176 | Lưu check-in thất bại. Vui lòng thử lại. | `setErrorToast("Lưu check-in thất bại. Vui lòng thử lại.");` | `luu_checkin_that_bai_vui` |

### 📁 [NotificationProvider.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/context/NotificationProvider.tsx)
*Đường dẫn đầy đủ: `src/context/NotificationProvider.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 174 | ${actor} đã bình luận về ${notification.checkpoint_name ?? | `return `${actor} đã bình luận về ${notification.checkpoint_name ?? "check-in ...` | `actor_da_binh_luan_ve` |
| 176 | ${actor} đã bày tỏ cảm xúc về ${notification.checkpoint_name ?? | `return `${actor} đã bày tỏ cảm xúc về ${notification.checkpoint_name ?? "chec...` | `actor_da_bay_to_cam` |
| 178 | ${actor} đã theo dõi bạn | `return `${actor} đã theo dõi bạn`;` | `actor_da_theo_doi_ban` |
| 180 | ${actor} đã bỏ theo dõi bạn | `return `${actor} đã bỏ theo dõi bạn`;` | `actor_da_bo_theo_doi` |
| 182 | ${actor} vừa đăng check-in mới | `return `${actor} vừa đăng check-in mới`;` | `actor_vua_dang_checkin_moi` |

### 📁 [useCheckin.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/hooks/useCheckin.tsx)
*Đường dẫn đầy đủ: `src/hooks/useCheckin.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 22 | Trình duyệt không hỗ trợ định vị | `setToast("Trình duyệt không hỗ trợ định vị");` | `trinh_duyet_khong_ho_tro` |

### 📁 [useDeleteCheckpoint.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/hooks/useDeleteCheckpoint.tsx)
*Đường dẫn đầy đủ: `src/hooks/useDeleteCheckpoint.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 47 | Không xóa được. Vui lòng thử lại. | `setError("Không xóa được. Vui lòng thử lại.");` | `khong_xoa_duoc_vui_long` |
| 55 | Xóa vĩnh viễn check-in này? Ảnh sẽ bị xóa và XP đã nhận sẽ bị trừ lại. | `Xóa vĩnh viễn check-in này? Ảnh sẽ bị xóa và XP đã nhận sẽ bị trừ lại.` | `xoa_vinh_vien_checkin_nay` |
| 60 | Đang xóa... | `{deleting ? "Đang xóa..." : "Xóa vĩnh viễn"}` | `dang_xoa` |
| 60 | Xóa vĩnh viễn | `{deleting ? "Đang xóa..." : "Xóa vĩnh viễn"}` | `xoa_vinh_vien` |
| 68 | Hủy | `Hủy` | `huy` |

### 📁 [useLocationLabel.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/hooks/useLocationLabel.ts)
*Đường dẫn đầy đủ: `src/hooks/useLocationLabel.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 8 | Đang dùng vị trí mặc định TP.HCM | `locationLabel: "Đang dùng vị trí mặc định TP.HCM",` | `dang_dung_vi_tri_mac` |
| 9 | Bật vị trí để xem các checkpoint quanh bạn chính xác hơn | `locationHint: "Bật vị trí để xem các checkpoint quanh bạn chính xác hơn",` | `bat_vi_tri_de_xem` |
| 15 | Gần bạn | `locationLabel: placeLabel ?? "Gần bạn",` | `gan_ban` |
| 17 | Địa điểm đang được sắp xếp quanh khu vực này | `? "Địa điểm đang được sắp xếp quanh khu vực này"` | `dia_diem_dang_duoc_sap` |
| 18 | Đang xác định khu vực của bạn | `: "Đang xác định khu vực của bạn",` | `dang_xac_dinh_khu_vuc` |

### 📁 [api.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/api.ts)
*Đường dẫn đầy đủ: `src/lib/api.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 323 | Ảnh phải là jpeg, png, webp hoặc gif. | `if (res.status === 415) throw new Error("Ảnh phải là jpeg, png, webp hoặc gif...` | `anh_phai_la_jpeg_png` |

### 📁 [authErrors.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/authErrors.ts)
*Đường dẫn đầy đủ: `src/lib/authErrors.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 5 | Email hoặc mật khẩu không đúng. | `invalid_credentials: "Email hoặc mật khẩu không đúng.",` | `email_hoac_mat_khau_khong` |
| 6 | Email chưa được xác nhận. Vui lòng kiểm tra hộp thư của bạn. | `email_not_confirmed: "Email chưa được xác nhận. Vui lòng kiểm tra hộp thư của...` | `email_chua_duoc_xac_nhan` |
| 7 | Email này đã được đăng ký. Hãy đăng nhập. | `user_already_exists: "Email này đã được đăng ký. Hãy đăng nhập.",` | `email_nay_da_duoc_dang` |
| 9 | Mật khẩu quá yếu — cần ít nhất 6 ký tự. | `weak_password: "Mật khẩu quá yếu — cần ít nhất 6 ký tự.",` | `mat_khau_qua_yeu_can` |
| 10 | Đăng nhập khách đang tắt. Bật trong Supabase → Authentication. | `anonymous_provider_disabled: "Đăng nhập khách đang tắt. Bật trong Supabase → ...` | `dang_nhap_khach_dang_tat` |
| 11 | Đăng ký hiện đang bị tắt. | `signup_disabled: "Đăng ký hiện đang bị tắt.",` | `dang_ky_hien_dang_bi` |
| 13 | Phương thức đăng nhập này đang bị tắt. | `provider_disabled: "Phương thức đăng nhập này đang bị tắt.",` | `phuong_thuc_dang_nhap_nay` |
| 14 | Gửi email quá nhiều lần. Vui lòng thử lại sau ít phút. | `over_email_send_rate_limit: "Gửi email quá nhiều lần. Vui lòng thử lại sau ít...` | `gui_email_qua_nhieu_lan` |
| 15 | Bạn thao tác quá nhanh. Vui lòng thử lại sau ít phút. | `over_request_rate_limit: "Bạn thao tác quá nhanh. Vui lòng thử lại sau ít phú...` | `ban_thao_tac_qua_nhanh` |
| 16 | Thông tin nhập vào không hợp lệ. | `validation_failed: "Thông tin nhập vào không hợp lệ.",` | `thong_tin_nhap_vao_khong` |
| 17 | Địa chỉ email không hợp lệ. | `email_address_invalid: "Địa chỉ email không hợp lệ.",` | `dia_chi_email_khong_hop` |
| 18 | Mật khẩu mới phải khác mật khẩu hiện tại. | `same_password: "Mật khẩu mới phải khác mật khẩu hiện tại.",` | `mat_khau_moi_phai_khac` |
| 19 | Phiên đã hết hạn. Vui lòng đăng nhập lại. | `session_not_found: "Phiên đã hết hạn. Vui lòng đăng nhập lại.",` | `phien_da_het_han_vui` |
| 21 | Tài khoản đã bị khoá. | `user_banned: "Tài khoản đã bị khoá.",` | `tai_khoan_da_bi_khoa` |
| 22 | Xác thực captcha thất bại. Vui lòng thử lại. | `captcha_failed: "Xác thực captcha thất bại. Vui lòng thử lại.",` | `xac_thuc_captcha_that_bai` |
| 23 | Email này không được phép đăng nhập. | `email_address_not_authorized: "Email này không được phép đăng nhập.",` | `email_nay_khong_duoc_phep` |
| 24 | Tài khoản Google này đã được dùng cho tài khoản khác. Hãy đăng nhập trực tiếp. | `identity_already_exists: "Tài khoản Google này đã được dùng cho tài khoản khá...` | `tai_khoan_google_nay_da` |
| 25 | Liên kết tài khoản đang bị tắt trong cấu hình Supabase. | `manual_linking_disabled: "Liên kết tài khoản đang bị tắt trong cấu hình Supab...` | `lien_ket_tai_khoan_dang` |
| 38 | Không kết nối được máy chủ. Kiểm tra kết nối mạng. | `[/network\|failed to fetch\|load failed/i, "Không kết nối được máy chủ. Kiểm ...` | `khong_ket_noi_duoc_may` |
| 52 | Có lỗi xảy ra. Vui lòng thử lại. | `return "Có lỗi xảy ra. Vui lòng thử lại.";` | `co_loi_xay_ra_vui` |

### 📁 [avatarFrames.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/avatarFrames.ts)
*Đường dẫn đầy đủ: `src/lib/avatarFrames.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 47 | Cấp ${level} | `label: `Cấp ${level}`,` | `cap_level` |
| 56 | Bước chân đầu tiên | `{ id: "first-step", file: checkpointImageUrl(`${FRAMES_BASE}/avatar-frame-fir...` | `buoc_chan_dau_tien` |
| 57 | Nhà thám hiểm | `{ id: "explorer", file: checkpointImageUrl(`${FRAMES_BASE}/avatar-frame-explo...` | `nha_tham_hiem` |
| 58 | Vòng quanh đất nước | `{ id: "country", file: checkpointImageUrl(`${FRAMES_BASE}/avatar-frame-countr...` | `vong_quanh_dat_nuoc` |
| 59 | Cú đêm | `{ id: "night-owl", file: checkpointImageUrl(`${FRAMES_BASE}/avatar-frame-nigh...` | `cu_dem` |
| 60 | Kẻ lữ hành | `{ id: "traveler", file: checkpointImageUrl(`${FRAMES_BASE}/avatar-frame-trave...` | `ke_lu_hanh` |

### 📁 [bigdatacloud.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/bigdatacloud.ts)
*Đường dẫn đầy đủ: `src/lib/bigdatacloud.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 4 | Thành phố Hồ Chí Minh | `provinceName: string; // Display name (e.g. "Thành phố Hồ Chí Minh")` | `thanh_pho_ho_chi_minh` |
| 30 | Hạnh Thông | `locality?: string;                  // Ward/Commune/Neighborhood (e.g. "Hạnh ...` | `hanh_thong` |

### 📁 [comments.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/comments.ts)
*Đường dẫn đầy đủ: `src/lib/comments.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 73 | Người dùng | `username: user?.username ?? "Người dùng",` | `nguoi_dung` |

### 📁 [i18n.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/i18n.ts)
*Đường dẫn đầy đủ: `src/lib/i18n.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 9 | Bản đồ | `map: "Bản đồ",` | `ban_do` |
| 10 | Khám phá | `discover: "Khám phá",` | `kham_pha` |
| 11 | Tạo mới | `create: "Tạo mới",` | `tao_moi` |
| 13 | Bảng XH | `leaderboard: "Bảng XH",` | `bang_xh` |
| 14 | Cá nhân | `profile: "Cá nhân",` | `ca_nhan` |
| 18 | Sửa hồ sơ | `editProfile: "Sửa hồ sơ",` | `sua_ho_so` |
| 19 | Danh hiệu | `badges: "Danh hiệu",` | `danh_hieu` |
| 20 | Xem tất cả | `viewAll: "Xem tất cả",` | `xem_tat_ca` |
| 21 | Bảng xếp hạng | `leaderboard: "Bảng xếp hạng",` | `bang_xep_hang` |
| 22 | Xem thứ hạng XP của bạn | `leaderboardDesc: "Xem thứ hạng XP của bạn",` | `xem_thu_hang_xp_cua` |
| 23 | Hạng | `rank: "Hạng",` | `hang` |
| 24 | điểm | `points: "điểm",` | `diem` |
| 25 | Cài đặt | `settings: "Cài đặt",` | `cai_dat` |
| 26 | Check-in luôn khi mở app | `openCreateOnLaunch: "Check-in luôn khi mở app",` | `checkin_luon_khi_mo_app` |
| 27 | Đi thẳng đến màn hình cắm cờ mỗi khi tải lại hoặc mở app. | `openCreateOnLaunchDesc: "Đi thẳng đến màn hình cắm cờ mỗi khi tải lại hoặc mở...` | `di_thang_den_man_hinh` |
| 28 | Ưu tiên chụp ảnh khi check-in | `preferCameraOnCheckin: "Ưu tiên chụp ảnh khi check-in",` | `uu_tien_chup_anh_khi` |
| 29 | Tự mở camera một lần khi bắt đầu check-in. | `preferCameraOnCheckinDesc: "Tự mở camera một lần khi bắt đầu check-in.",` | `tu_mo_camera_mot_lan` |
| 30 | Ngôn ngữ | `language: "Ngôn ngữ",` | `ngon_ngu` |
| 31 | Chọn ngôn ngữ hiển thị | `languageDesc: "Chọn ngôn ngữ hiển thị",` | `chon_ngon_ngu_hien_thi` |
| 32 | Tiếng Việt | `vi: "Tiếng Việt",` | `tieng_viet` |
| 33 | Tiếng Anh | `en: "Tiếng Anh",` | `tieng_anh` |
| 34 | Đăng xuất | `logout: "Đăng xuất",` | `dang_xuat` |
| 35 | Cấp độ hiện tại | `level: "Cấp độ hiện tại",` | `cap_do_hien_tai` |
| 36 | Còn {{count}} XP nữa để lên cấp {{level}} | `xpToNext: "Còn {{count}} XP nữa để lên cấp {{level}}",` | `con_count_xp_nua_de` |
| 37 | Bạn đã đạt cấp tối đa! 🏆 | `maxLevel: "Bạn đã đạt cấp tối đa! 🏆",` | `ban_da_dat_cap_toi` |
| 38 | TỔNG XP | `totalXpLabel: "TỔNG XP",` | `tong_xp` |
| 39 | SỐ CỜ | `checkpointCountLabel: "SỐ CỜ",` | `so_co` |
| 40 | HÀNH TRÌNH | `journeyCountLabel: "HÀNH TRÌNH",` | `hanh_trinh` |
| 41 | CẤP | `levelLabel: "CẤP",` | `cap` |

### 📁 [maps.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/maps.ts)
*Đường dẫn đầy đủ: `src/lib/maps.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 13 | Cà phê | `{ key: "cafe", label: "Cà phê", icon: "coffee", emoji: "☕" },` | `ca_phe` |
| 14 | Ăn uống | `{ key: "food", label: "Ăn uống", icon: "food", emoji: "🍜" },` | `an_uong` |
| 15 | Ngắm cảnh | `{ key: "view", label: "Ngắm cảnh", icon: "mountain", emoji: "🌄" },` | `ngam_canh` |
| 16 | Thiên nhiên | `{ key: "nature", label: "Thiên nhiên", icon: "tree", emoji: "🌲" },` | `thien_nhien` |
| 17 | Khác | `{ key: "other", label: "Khác", icon: "pin", emoji: "📍" },` | `khac` |

### 📁 [shareCard.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/shareCard.ts)
*Đường dẫn đầy đủ: `src/lib/shareCard.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 394 | Quét để xem | `ctx.fillText("Quét để xem", PAD, rowY + QR_SIZE / 2 - 18);` | `quet_de_xem` |
| 397 | trên Checkpoint | `ctx.fillText("trên Checkpoint", PAD, rowY + QR_SIZE / 2 + 2);` | `tren_checkpoint` |
| 424 | bởi ${data.author} | `footer({ left: `+${data.xp} XP`, center: `bởi ${data.author}`, right: data.da...` | `boi_dataauthor` |
| 445 | header( emoji: "🧳", title: data.title, subtitle: "Hành trình" ), | `header({ emoji: "🧳", title: data.title, subtitle: "Hành trình" }),` | `header_emoji_title_datatitle_subtitle` |
| 472 | Tổng XP | `{ label: "Tổng XP", value: data.totalXp.toLocaleString() },` | `tong_xp` |
| 473 | Số cờ | `{ label: "Số cờ", value: String(data.checkpointCount) },` | `so_co` |
| 474 | Hành trình | `{ label: "Hành trình", value: String(data.journeyCount) },` | `hanh_trinh` |
| 476 | Hộ chiếu du lịch của tôi 🛂 | `centerText("Hộ chiếu du lịch của tôi 🛂"),` | `ho_chieu_du_lich_cua` |

### 📁 [video.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/lib/video.ts)
*Đường dẫn đầy đủ: `src/lib/video.ts`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 20 | File không phải video. | `throw new Error("File không phải video.");` | `file_khong_phai_video` |
| 23 | Video quá lớn. Tối đa ${Math.round(MAX_INPUT_VIDEO_BYTES / (1024 * 1024))}MB. | `throw new Error(`Video quá lớn. Tối đa ${Math.round(MAX_INPUT_VIDEO_BYTES / (...` | `video_qua_lon_toi_da` |
| 34 | Không đọc được metadata video. | `await waitForEvent(video, "loadedmetadata", "Không đọc được metadata video.");` | `khong_doc_duoc_metadata_video` |
| 36 | Không đọc được độ dài video. | `throw new Error("Không đọc được độ dài video.");` | `khong_doc_duoc_do_dai` |
| 39 | Video quá dài. Tối đa 10 giây. | `throw new Error("Video quá dài. Tối đa 10 giây.");` | `video_qua_dai_toi_da` |
| 44 | Không lấy được khung hình video. | `await waitForEvent(video, "seeked", "Không lấy được khung hình video.");` | `khong_lay_duoc_khung_hinh` |
| 49 | Không tạo được canvas thumbnail. | `if (!ctx) throw new Error("Không tạo được canvas thumbnail.");` | `khong_tao_duoc_canvas_thumbnail` |
| 53 | Không tạo được ảnh thumbnail. | `canvas.toBlob((b) => (b ? resolve(b) : reject(new Error("Không tạo được ảnh t...` | `khong_tao_duoc_anh_thumbnail` |

### 📁 [AIPlanPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/AIPlanPage.tsx)
*Đường dẫn đầy đủ: `src/pages/AIPlanPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 5 | Lên lịch trình từ data cộng đồng | `"Lên lịch trình từ data cộng đồng",` | `len_lich_trinh_tu_data` |
| 6 | Gợi ý địa điểm hợp gu bạn | `"Gợi ý địa điểm hợp gu bạn",` | `goi_y_dia_diem_hop` |
| 7 | Tự xếp ảnh theo hành trình | `"Tự xếp ảnh theo hành trình",` | `tu_xep_anh_theo_hanh` |
| 21 | Trợ lý AI | `<h2 className="font-display text-2xl font-bold text-clay-600">Trợ lý AI</h2>` | `tro_ly_ai` |
| 23 | Sắp ra mắt | `<Icon name="sparkles" size={14} /> Sắp ra mắt` | `sap_ra_mat` |
| 27 | Tính năng lập kế hoạch chuyến đi bằng AI đang được phát triển. Sẽ có ở bản cập nhật tới! | `Tính năng lập kế hoạch chuyến đi bằng AI đang được phát triển. Sẽ có ở bản cậ...` | `tinh_nang_lap_ke_hoach` |

### 📁 [BadgeCollectionPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/BadgeCollectionPage.tsx)
*Đường dẫn đầy đủ: `src/pages/BadgeCollectionPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 16 | địa điểm | `explorer_10: { label: "địa điểm", max: 10, getValue: (cp) => cp },` | `dia_diem` |
| 17 | tỉnh/thành | `provinces_5: { label: "tỉnh/thành", max: 5, getValue: (_, prov) => prov },` | `tinhthanh` |
| 50 | Tất cả (${badges.length}) | `{ key: "all", label: `Tất cả (${badges.length})` },` | `tat_ca_badgeslength` |
| 51 | Đã mở khóa (${unlocked.length}) | `{ key: "unlocked", label: `Đã mở khóa (${unlocked.length})` },` | `da_mo_khoa_unlockedlength` |
| 52 | Chưa mở khóa (${locked.length}) | `{ key: "locked", label: `Chưa mở khóa (${locked.length})` },` | `chua_mo_khoa_lockedlength` |
| 58 | Bộ sưu tập huy hiệu | `<h1 className="font-display text-2xl font-bold text-foreground">Bộ sưu tập hu...` | `bo_suu_tap_huy_hieu` |
| 60 | unlocked.length/badges.length huy hiệu đã mở khóa | `{unlocked.length}/{badges.length} huy hiệu đã mở khóa` | `unlockedlengthbadgeslength_huy_hieu_da_mo` |
| 105 | Chưa có huy hiệu nào. Hãy check-in để mở khóa! | `? "Chưa có huy hiệu nào. Hãy check-in để mở khóa!"` | `chua_co_huy_hieu_nao` |
| 106 | Tất cả huy hiệu đã được mở khóa! | `: "Tất cả huy hiệu đã được mở khóa!"}` | `tat_ca_huy_hieu_da` |
| 123 | Đã mở khóa | `<Icon name="check" size={12} /> Đã mở khóa` | `da_mo_khoa` |
| 133 | Chưa mở khóa | `Chưa mở khóa` | `chua_mo_khoa` |
| 144 | Tiến trình thành tựu | `<h2 className="mb-3 font-display text-lg font-bold">Tiến trình thành tựu</h2>` | `tien_trinh_thanh_tuu` |

### 📁 [CreatePage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/CreatePage.tsx)
*Đường dẫn đầy đủ: `src/pages/CreatePage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 65 | Cắm cờ | `{t === "gps" ? "Cắm cờ" : "Từ ảnh"}` | `cam_co` |
| 65 | Từ ảnh | `{t === "gps" ? "Cắm cờ" : "Từ ảnh"}` | `tu_anh` |
| 106 | Cắm cờ tại đây | `<h1 className="font-display text-2xl font-bold text-clay-600">Cắm cờ tại đây<...` | `cam_co_tai_day` |

### 📁 [DiscoverPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/DiscoverPage.tsx)
*Đường dẫn đầy đủ: `src/pages/DiscoverPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 30 | Tất cả | `{ key: "all", label: "Tất cả" },` | `tat_ca` |
| 32 | Đang hot | `{ key: "hot", label: "Đang hot", icon: "flag" },` | `dang_hot` |
| 34 | Ăn uống | `{ key: "food", label: "Ăn uống", icon: "utensils" },` | `an_uong` |
| 35 | Có ảnh | `{ key: "photos", label: "Có ảnh", icon: "image" },` | `co_anh` |
| 214 | Đang làm mới... | `? "Đang làm mới..."` | `dang_lam_moi` |
| 216 | Thả để làm mới | `? "Thả để làm mới"` | `tha_de_lam_moi` |
| 217 | Kéo xuống để làm mới | `: "Kéo xuống để làm mới"}` | `keo_xuong_de_lam_moi` |
| 227 | Tìm địa điểm | `aria-label="Tìm địa điểm"` | `tim_dia_diem` |
| 231 | Tìm địa điểm, quán cafe, nơi check-in… | `placeholder="Tìm địa điểm, quán cafe, nơi check-in…"` | `tim_dia_diem_quan_cafe` |
| 239 | Xóa tìm kiếm | `aria-label="Xóa tìm kiếm"` | `xoa_tim_kiem` |
| 254 | Mở bộ lọc | `aria-label="Mở bộ lọc"` | `mo_bo_loc` |
| 272 | Không tìm thấy địa điểm “debounced”. | `Không tìm thấy địa điểm “{debounced}”.` | `khong_tim_thay_dia_diem` |
| 298 | Đang hot gần bạn | `<Icon name="star" size={22} className="fill-gold text-gold" /> Đang hot gần bạn` | `dang_hot_gan_ban` |
| 300 | Nhiều người vừa cắm cờ | `<p className="text-xs text-muted-foreground">Nhiều người vừa cắm cờ</p>` | `nhieu_nguoi_vua_cam_co` |
| 327 | Địa điểm đang hot | `{filters.active === "hot" ? "Địa điểm đang hot" : "Địa điểm gần bạn"}` | `dia_diem_dang_hot` |
| 327 | Địa điểm gần bạn | `{filters.active === "hot" ? "Địa điểm đang hot" : "Địa điểm gần bạn"}` | `dia_diem_gan_ban` |
| 330 | visiblePlaces.length địa điểm trong danh sách hiện tại | `{visiblePlaces.length} địa điểm trong danh sách hiện tại` | `visibleplaceslength_dia_diem_trong_danh` |
| 343 | Chưa có địa điểm nào quanh đây. Hãy là người cắm cờ đầu tiên! | `Chưa có địa điểm nào quanh đây. Hãy là người cắm cờ đầu tiên!` | `chua_co_dia_diem_nao` |
| 401 | Bộ lọc tìm kiếm | `<Sheet title="Bộ lọc tìm kiếm" onClose={() => setIsFilterSheetOpen(false)}>` | `bo_loc_tim_kiem` |
| 403 | Chọn danh mục lọc nhanh | `<p className="text-xs font-semibold text-muted-foreground uppercase tracking-...` | `chon_danh_muc_loc_nhanh` |
| 464 | Đã cắm | `const cta = place.viewer_has_checked_in ? "Đã cắm" : signedIn ? "Cắm cờ" : "X...` | `da_cam` |
| 464 | Cắm cờ | `const cta = place.viewer_has_checked_in ? "Đã cắm" : signedIn ? "Cắm cờ" : "X...` | `cam_co` |
| 613 | Đang đăng check-in... | `{count === 1 ? "Đang đăng check-in..." : `Đang đăng ${count} check-in...`}` | `dang_dang_checkin` |
| 613 | Đang đăng ${count} check-in... | `{count === 1 ? "Đang đăng check-in..." : `Đang đăng ${count} check-in...`}` | `dang_dang_count_checkin` |

### 📁 [FeedPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/FeedPage.tsx)
*Đường dẫn đầy đủ: `src/pages/FeedPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 194 | Đang làm mới... | `? "Đang làm mới..."` | `dang_lam_moi` |
| 196 | Thả để làm mới | `? "Thả để làm mới"` | `tha_de_lam_moi` |
| 197 | Kéo xuống để làm mới | `: "Kéo xuống để làm mới"}` | `keo_xuong_de_lam_moi` |
| 215 | Không tìm thấy địa điểm “debounced”. | `Không tìm thấy địa điểm “{debounced}”.` | `khong_tim_thay_dia_diem` |
| 246 | Dành cho bạn | `["for-you", "Dành cho bạn"],` | `danh_cho_ban` |
| 247 | Đang theo dõi | `...(user ? [["following", "Đang theo dõi"] as const] : []),` | `dang_theo_doi` |
| 279 | Chưa theo dõi ai. Bấm ⋮ trên bài check-in để theo dõi. | `? "Chưa theo dõi ai. Bấm ⋮ trên bài check-in để theo dõi."` | `chua_theo_doi_ai_bam` |
| 280 | Chưa có check-in nào quanh đây. Hãy là người cắm cờ đầu tiên! | `: "Chưa có check-in nào quanh đây. Hãy là người cắm cờ đầu tiên!"}` | `chua_co_checkin_nao_quanh` |
| 348 | Đang đăng check-in... | `{count === 1 ? "Đang đăng check-in..." : `Đang đăng ${count} check-in...`}` | `dang_dang_checkin` |
| 348 | Đang đăng ${count} check-in... | `{count === 1 ? "Đang đăng check-in..." : `Đang đăng ${count} check-in...`}` | `dang_dang_count_checkin` |
| 404 | Mình vừa thấy check-in tại ${item.name} trên Checkpoint! | `text: `Mình vừa thấy check-in tại ${item.name} trên Checkpoint!`,` | `minh_vua_thay_checkin_tai` |
| 468 | Tùy chọn | `aria-label="Tùy chọn"` | `tuy_chon` |
| 478 | Chia sẻ | `<Icon name="share" size={16} /> Chia sẻ` | `chia_se` |
| 488 | Xoá check-in | `<Icon name="trash" size={16} /> Xoá check-in` | `xoa_checkin` |
| 498 | Bỏ theo dõi | `<Icon name="user-minus" size={16} /> Bỏ theo dõi` | `bo_theo_doi` |
| 502 | Theo dõi | `<Icon name="user-plus" size={16} /> Theo dõi` | `theo_doi` |
| 541 | cách distance | `<Icon name="map-pin" size={14} /> cách {distance}` | `cach_distance` |

### 📁 [LeaderboardPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/LeaderboardPage.tsx)
*Đường dẫn đầy đủ: `src/pages/LeaderboardPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 86 | Mở hồ sơ ${name}, hạng ${entry.rank} | `aria-label={`Mở hồ sơ ${name}, hạng ${entry.rank}`}` | `mo_ho_so_name_hang` |
| 157 | Hạng entry.rank | `Hạng {entry.rank}` | `hang_entryrank` |
| 172 | Tuần khám phá | `Tuần khám phá` | `tuan_kham_pha` |
| 175 | Bảng xếp hạng | `Bảng xếp hạng` | `bang_xep_hang` |
| 191 | Người chơi | `<p className="text-[11px] font-semibold text-muted-foreground">Người chơi</p>` | `nguoi_choi` |
| 197 | Bạn | `<p className="text-[11px] font-semibold text-muted-foreground">Bạn</p>` | `ban` |
| 259 | Chưa có ai trên bảng xếp hạng | `<p className="mt-3 font-bold text-foreground">Chưa có ai trên bảng xếp hạng</p>` | `chua_co_ai_tren_bang` |
| 261 | Check-in đầu tiên sẽ mở màn cuộc đua XP. | `Check-in đầu tiên sẽ mở màn cuộc đua XP.` | `checkin_dau_tien_se_mo` |
| 267 | Top 3 nhà khám phá | `<section aria-label="Top 3 nhà khám phá">` | `top_3_nha_kham_pha` |
| 283 | Top nhà khám phá | `<section className="flex flex-col gap-2" aria-label="Top nhà khám phá">` | `top_nha_kham_pha` |
| 303 | Hạng của bạn | `<section className="flex flex-col gap-2 pt-1" aria-label="Hạng của bạn">` | `hang_cua_ban` |

### 📁 [LoginPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/LoginPage.tsx)
*Đường dẫn đầy đủ: `src/pages/LoginPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 36 | Khám phá thế giới, | `Khám phá thế giới,` | `kham_pha_the_gioi` |
| 38 | lưu dấu hành trình | `lưu dấu hành trình` | `luu_dau_hanh_trinh` |
| 57 | Mật khẩu | `placeholder="Mật khẩu"` | `mat_khau` |
| 62 | Đang xử lý... | `{busy ? "Đang xử lý..." : mode === "signin" ? "Đăng nhập" : "Đăng ký"}` | `dang_xu_ly` |
| 62 | Đăng nhập | `{busy ? "Đang xử lý..." : mode === "signin" ? "Đăng nhập" : "Đăng ký"}` | `dang_nhap` |
| 62 | Đăng ký | `{busy ? "Đang xử lý..." : mode === "signin" ? "Đăng nhập" : "Đăng ký"}` | `dang_ky` |
| 68 | hoặc | `hoặc` | `hoac` |
| 73 | Tiếp tục với Google | `Tiếp tục với Google` | `tiep_tuc_voi_google` |
| 92 | Dùng thử không cần đăng nhập | `Dùng thử không cần đăng nhập` | `dung_thu_khong_can_dang` |
| 96 | Bạn chưa có tài khoản? | `{mode === "signin" ? "Bạn chưa có tài khoản? " : "Đã có tài khoản? "}` | `ban_chua_co_tai_khoan` |
| 96 | Đã có tài khoản? | `{mode === "signin" ? "Bạn chưa có tài khoản? " : "Đã có tài khoản? "}` | `da_co_tai_khoan` |
| 107 | Đăng ký ngay | `{mode === "signin" ? "Đăng ký ngay" : "Đăng nhập"}` | `dang_ky_ngay` |

### 📁 [MapPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/MapPage.tsx)
*Đường dẫn đầy đủ: `src/pages/MapPage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 30 | Tất cả | `all: "Tất cả",` | `tat_ca` |
| 31 | Đang follow | `following: "Đang follow",` | `dang_follow` |
| 32 | Của tôi | `mine: "Của tôi",` | `cua_toi` |
| 339 | Lọc ${activeCategory.label} | `aria-label={activeCategory ? `Lọc ${activeCategory.label}` : "Lọc theo danh m...` | `loc_activecategorylabel` |
| 339 | Lọc theo danh mục | `aria-label={activeCategory ? `Lọc ${activeCategory.label}` : "Lọc theo danh m...` | `loc_theo_danh_muc` |
| 342 | Tất cả danh mục | `title={activeCategory ? activeCategory.label : "Tất cả danh mục"}` | `tat_ca_danh_muc` |
| 484 | checkpoints.length địa điểm | `{checkpoints.length} địa điểm` | `checkpointslength_dia_diem` |

### 📁 [ProfilePage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/src/pages/ProfilePage.tsx)
*Đường dẫn đầy đủ: `src/pages/ProfilePage.tsx`*

| Dòng | Chuỗi văn bản cứng | Dòng code gốc | Khóa i18n gợi ý |
| :--- | :--- | :--- | :--- |
| 128 | Đã kết nối Google Drive ✓ | `setDriveToast("Đã kết nối Google Drive ✓");` | `da_ket_noi_google_drive` |
| 133 | Kết nối Google Drive thất bại | `setDriveToast("Kết nối Google Drive thất bại");` | `ket_noi_google_drive_that` |
| 137 | Đã kết nối Google Photos ✓ | `setDriveToast("Đã kết nối Google Photos ✓");` | `da_ket_noi_google_photos` |
| 142 | Kết nối Google Photos thất bại | `setDriveToast("Kết nối Google Photos thất bại");` | `ket_noi_google_photos_that` |
| 177 | Cài đặt | `aria-label="Cài đặt"` | `cai_dat` |
| 188 | Xem hồ sơ công khai | `aria-label="Xem hồ sơ công khai"` | `xem_ho_so_cong_khai` |
| 199 | Cấp user.level | `Cấp {user.level}` | `cap_userlevel` |
| 224 | user.checkin_streak ngày liên tiếp | `{user.checkin_streak} ngày liên tiếp` | `usercheckin_streak_ngay_lien_tiep` |
| 229 | Thành viên từ formatMemberSince(user.created_at) | `Thành viên từ {formatMemberSince(user.created_at)}` | `thanh_vien_tu_formatmembersinceusercreated_at` |
| 236 | Huy hiệu | `{ label: t("profile.badgesLabel", "Huy hiệu"), value: unlockedBadges.length.t...` | `huy_hieu` |
| 237 | Cờ | `{ label: t("profile.checkpointCountLabel", "Cờ"), value: user.checkpoint_coun...` | `co` |
| 238 | Hành trình | `{ label: t("profile.journeyCountLabel", "Hành trình"), value: user.journey_co...` | `hanh_trinh` |
| 239 | Cấp | `{ label: t("profile.levelLabel", "Cấp"), value: user.level.toString() },` | `cap` |
| 260 | Cấp độ hiện tại | `<p className="font-semibold text-foreground">{t("profile.currentLevel", "Cấp ...` | `cap_do_hien_tai` |
| 295 | Xem tất cả | `Xem tất cả <Icon name="chevron-right" size={14} />` | `xem_tat_ca` |
| 314 | Chưa có huy hiệu nào. Hãy check-in để mở khóa! | `Chưa có huy hiệu nào. Hãy check-in để mở khóa!` | `chua_co_huy_hieu_nao` |
| 340 | Bảng xếp hạng | `<Icon name="trophy" size={20} className="text-gold" /> Bảng xếp hạng` | `bang_xep_hang` |
| 354 | Chưa có dữ liệu bảng xếp hạng. | `<p className="text-sm text-muted-foreground">Chưa có dữ liệu bảng xếp hạng.</p>` | `chua_co_du_lieu_bang` |
| 372 | Khoảnh khắc hành trình | `<h3 className="font-display text-lg font-bold">Khoảnh khắc hành trình</h3>` | `khoanh_khac_hanh_trinh` |
| 379 | Xem tất cả check-in | `aria-label="Xem tất cả check-in"` | `xem_tat_ca_checkin` |
| 393 | Chưa có check-in nào. Mở tab Map và cắm cờ địa điểm đầu tiên! | `Chưa có check-in nào. Mở tab Map và cắm cờ địa điểm đầu tiên!` | `chua_co_checkin_nao_mo` |
| 434 | Hộ chiếu Checkpoint của ${user.display_name || user.username} | `title={`Hộ chiếu Checkpoint của ${user.display_name \|\| user.username}`}` | `ho_chieu_checkpoint_cua_userdisplay` |
| 435 | Mình đã cắm ${user.checkpoint_count} cờ trên Checkpoint! | `text={`Mình đã cắm ${user.checkpoint_count} cờ trên Checkpoint!`}` | `minh_da_cam_usercheckpoint_count` |
| 437 | Chia sẻ Hộ chiếu Điện tử | `label="Chia sẻ Hộ chiếu Điện tử"` | `chia_se_ho_chieu_dien` |